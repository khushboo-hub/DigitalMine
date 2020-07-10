import numpy as np
from django.db import models
from datetime import datetime


class Gasdb(models.Model):
    o2 = models.FloatField()
    co = models.FloatField()
    ch4 = models.FloatField()
    co2 = models.FloatField()
    h2 = models.FloatField()
    n2 = models.FloatField()
    c2h4 = models.FloatField()
    date = models.DateField(unique=True)

    def findExplosibility(self):
        o2 = self.o2
        co = self.co
        ch4 = self.ch4
        co2 = self.co2
        h2 = self.h2
        n2 = self.n2
        c2h4 = self.c2h4
        # ratio calculation
        try:
            graham = (100 * co / (0.265 * n2 - o2))
        except ZeroDivisionError:
            graham=0
            pass
        try:
            young = (100 * co2 / (0.265 * n2 - o2))
        except ZeroDivisionError:
            young=0
            pass
        try:
            coco2 = 100 * co / co2
        except ZeroDivisionError:
            coco2=0
            pass
        try:
            jtr = (co2 + 0.75 * co - 0.25 * h2) / (0.265 * n2 - o2)
        except ZeroDivisionError:
            jtr=0
            pass

        if (c2h4 == 0):
            chra = 0
        else:
            chra = 3 * (co2 + co + ch4 + 2 * c2h4) / (0.2468 * n2 - o2 - co2 - 0.5 * h2 + ch4 + c2h4 + h2 - co)

        ##message calculation
        ##graham
        if (graham <= 0.4):
            grahamm = "Normal"
        elif (graham <= 0.5):
            grahamm = "Checkup required"
        elif (graham <= 1):
            grahamm = "Heating"
        elif (graham <= 2):
            grahamm = "Serious heating"
        elif (graham <= 7):
            grahamm = "FIRE with certainty"
        else:
            grahamm = "BLAZING FIRE"
        ##young
        if (young <= 25):
            youngm = "Superficial heating"
        elif (young <= 50):
            youngm = "FIRE present"
        else:
            youngm = "BLAZING FIRE"
        ##coco2
        if (coco2 <= 2):
            coco2m = "Normal"
        elif (coco2 <= 13):
            coco2m = "ACTIVE FIRE"
        else:
            coco2m = "BLAZING FIRE"
        ##jtr
        if (jtr <= 0.4):
            jtrm = "Indicative of no fire"
        elif (jtr <= 0.5):
            jtrm = "Indicative of methane fire"
        elif (jtr <= 1):
            jtrm = "Indicative of coal/oil/conveyor fire"
        else:
            jtrm = "Indicative of timber fire"
        ##chra
        if (chra <= 5):
            chram = "Superficial heating"
        elif (chra <= 20):
            chram = "ACTIVE FIRE"
        else:
            chram = "BLAZING FIRE"

        ##explosibility
        explos = 5
        pt = ch4 + co + h2

        ch4low = 5
        colow = 12.5
        h2low = 4
        ch4high = 14
        cohigh = 74.2
        h2high = 74.2
        ch4nose = 5.9
        conose = 13.8
        h2nose = 4.3
        ch4np = 6.07
        conp = 4.13
        h2np = 16.59
        try:
            Llow = pt / (ch4 / ch4low + co / colow + h2 / h2low)
        except ZeroDivisionError:
            Llow = 1
            pass
        try:
            Lhigh = pt / (ch4 / ch4high + co / cohigh + h2 / h2high)
        except ZeroDivisionError:
            Lhigh = 1
            pass
        try:
            Lnose = pt / (ch4 / ch4nose + co / conose + h2 / h2nose)
        except ZeroDivisionError:
            Lnose = 1
            pass

        try:
            Nex = Lnose / pt * (ch4np * ch4 + conp * co + h2np * h2)
        except ZeroDivisionError:
            Nex = 1
            pass

        Oxnose = 0.2093 * (100 - Nex - Lnose)

        ##total combustible at extinctive point
        Le = 20.93 * Lnose / (20.93 - Oxnose)
        ##oxygen at lower limit
        Ob = -20.93 * Llow / 100 + 20.93
        ##oxygen at upper limit
        Oc = -20.93 * Lhigh / 100 + 20.93

        if ((o2 >= 0) and (pt >= 0)):
            if (100 * o2 + 20.93 * pt >= 2093):
                explos = 4
            if (Le * o2 + 20.93 * pt <= Le * 20.93):
                explos = 0
            if ((100 * o2 + 20.93 * pt <= 2093) and (Le * o2 + 20.93 * pt >= Le * 20.93) and (
                    (Lnose - Llow) * o2 + (
                    Ob - Oxnose) * pt <= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow)):
                explos = 2
            if ((100 * o2 + 20.93 * pt <= 2093) and (Le * o2 + 20.93 * pt >= Le * 20.93) and (
                    (Lnose - Llow) * o2 + (
                    Ob - Oxnose) * pt >= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow) and (
                    (Lnose - Lhigh) * o2 + (
                    Oc - Oxnose) * pt <= Oc * Lnose - Oc * Lhigh - Oxnose * Lhigh + Oc * Lhigh)):
                explos = 3
            if ((100 * o2 + 20.93 * pt <= 2093) and (Le * o2 + 20.93 * pt >= Le * 20.93) and (
                    (Lnose - Llow) * o2 + (
                    Ob - Oxnose) * pt >= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow) and (
                    (Lnose - Lhigh) * o2 + (
                    Oc - Oxnose) * pt >= Oc * Lnose - Oc * Lhigh - Oxnose * Lhigh + Oc * Lhigh)):
                explos = 1

        ##explosibility message
        if (explos == 0):
            explosm = "Not explosive"
        elif (explos == 1):
            explosm = "Potentially explosive(if air is added)"
        elif (explos == 2):
            explosm = "Potentially explosive(if combustible gas is added)"
        elif (explos == 3):
            explosm = "Explosive"
        elif (explos == 4):
            explosm = "Impossible mixture"
        else:
            explosm = "Unidentified"
        data = {
            'explosibility': explosm,

            'graham': grahamm,
            'young': youngm,
            'coco2': coco2m,
            'jtr': jtrm,
            'chra': chram,
            'co':self.co,
            'graham_ratio': graham,
            'young_ratio': young,
            'coco2_ratio': coco2,
            'jtr_ratio': jtr,
            'chra_ratio': chra,
            'date':self.date
        }
        return data

    def graph(self):

        o2 = self.o2
        co = self.co
        ch4 = self.ch4
        co2 = self.co2
        h2 = self.h2
        n2 = self.n2
        c2h4 = self.c2h4
        explos = 5
        idtest = 0

        explos = 5
        print('ch4,co,h2',ch4,co,h2)
        pt = ch4 + co + h2

        ch4low = 5
        colow = 12.5
        h2low = 4
        ch4high = 14
        cohigh = 74.2
        h2high = 74.2
        ch4nose = 5.9
        conose = 13.8
        h2nose = 4.3
        ch4np = 6.07
        conp = 4.13
        h2np = 16.59
        try:
            Llow = pt / (ch4 / ch4low + co / colow + h2 / h2low)
        except ZeroDivisionError:
            Llow = 1
            pass
        try:
            Lhigh = pt / (ch4 / ch4high + co / cohigh + h2 / h2high)
        except ZeroDivisionError:
            Lhigh = 1
            pass
        try:
            Lnose = pt / (ch4 / ch4nose + co / conose + h2 / h2nose)
        except ZeroDivisionError:
            Lnose = 1
            pass

        try:
            Nex = Lnose / pt * (ch4np * ch4 + conp * co + h2np * h2)
        except ZeroDivisionError:
            Nex = 1
            pass

        Oxnose = 0.2093 * (100 - Nex - Lnose)

        ##total combustible at extinctive point
        Le = 20.93 * Lnose / (20.93 - Oxnose)
        ##oxygen at lower limit
        Ob = -20.93 * Llow / 100 + 20.93
        ##oxygen at upper limit
        Oc = -20.93 * Lhigh / 100 + 20.93

        if ((o2 >= 0) and (pt >= 0)):
            if (100 * o2 + 20.93 * pt >= 2093):
                explos = 4
            if (Le * o2 + 20.93 * pt <= Le * 20.93):
                explos = 0
            if ((100 * o2 + 20.93 * pt <= 2093) and (Le * o2 + 20.93 * pt >= Le * 20.93) and (
                    (Lnose - Llow) * o2 + (
                    Ob - Oxnose) * pt <= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow)):
                explos = 2
            if ((100 * o2 + 20.93 * pt <= 2093) and (Le * o2 + 20.93 * pt >= Le * 20.93) and (
                    (Lnose - Llow) * o2 + (
                    Ob - Oxnose) * pt >= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow) and (
                    (Lnose - Lhigh) * o2 + (
                    Oc - Oxnose) * pt <= Oc * Lnose - Oc * Lhigh - Oxnose * Lhigh + Oc * Lhigh)):
                explos = 3
            if ((100 * o2 + 20.93 * pt <= 2093) and (Le * o2 + 20.93 * pt >= Le * 20.93) and (
                    (Lnose - Llow) * o2 + (
                    Ob - Oxnose) * pt >= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow) and (
                    (Lnose - Lhigh) * o2 + (
                    Oc - Oxnose) * pt >= Oc * Lnose - Oc * Lhigh - Oxnose * Lhigh + Oc * Lhigh)):
                explos = 1

        ##0 NE, 1 PE w/air, 2 PE w/comb, 3 E, 4 IM, 5 Unidentified

        ##calculating Ellicott's Extension point

        ##calculating new x,y coordinates after origin shift
        xx = pt - Lnose
        yx = o2 - Oxnose

        xp = Llow - Lnose
        yp = Ob - Oxnose

        xq = Lhigh - Lnose
        yq = Oc - Oxnose

        xs = Le - Lnose
        ys = -Oxnose

        # calculating polar coordinates
        def properarctan(valuex, valuey):
            try:
                if valuex >= 0:
                    if (np.degrees(np.arctan(valuey / valuex) < 0)):
                        return (360 + np.degrees(np.arctan(valuey / valuex)))
                    else:
                        return np.degrees(np.arctan(valuey / valuex))
                else:
                    return (np.degrees(np.arctan(valuey / valuex)) + 180.0)
            except:
                return 0

        rx = np.sqrt(xx * xx + yx * yx)
        thx = properarctan(xx, yx)

        rp = np.sqrt(xp * xp + yp * yp)
        thp = properarctan(xp, yp)

        rq = np.sqrt(xq * xq + yq * yq)
        thq = properarctan(xq, yq)

        rs = np.sqrt(xs * xs + ys * ys)
        ths = properarctan(xs, ys)

        ##calculating r,theta values based on explosibiility
        if explos == 3:
            rm = rx
            thm = 90 * ((thx - thq) / (thx - thq + thp - thx))
        elif (explos == 1 or explos == 2):
            rm = rx
            thm = 270 + (90 * ((thx - ths) / (
                    thx - ths + thx - thq)))  ##HERE MADE A CHANGE FROM ELLICOTTS EXTENSION thx-thq instead of thq-thx
        elif explos == 0:
            rm = rx
            thm = 90 + (180 * ((thx - thp) / (thx - thp + ths - thx)))
        else:
            rm = 0
            thm = 0

        elx = rm * np.cos(np.radians(thm))
        ely = rm * np.sin(np.radians(thm))
        graph = {
            'x': elx,
            'y': ely,
            'color': self.markerclr(elx, ely),
            'quadrant': self.quadrant(elx, ely),
            'dates': self.date
        }

        return graph

    def markercrtr(self,numb):
        createdstring = '$' + str(numb + 1) + '$'
        return createdstring

    def markerclr(self,x, y):
        colorstring = '#77b5fe'
        if (x <= 0 and y <= 0):
            colorstring = '#4caf50'
        elif (x <= 0 and y > 0):
            colorstring = '#8bc34a'
        elif (x > 0 and y > 0):
            colorstring = '#ff9800'
        elif (x > 0 and y < 0):
            colorstring = '#f44336'
        return colorstring

    def quadrant(self,x, y):
        quad = 0
        if (x <= 0 and y <= 0):
            quad = 0
        elif (x <= 0 and y > 0):
            quad = 1
        elif (x > 0 and y > 0):
            quad = 2
        elif (x > 0 and y < 0):
            quad = 3
        return quad


    class Meta:
        db_table = "Fire_Exp_Manual"


class Fire_exp_gases(models.Model):
    o2 = models.FloatField()
    co = models.FloatField()
    ch4 = models.FloatField()
    co2 = models.FloatField()
    h2 = models.FloatField()
    n2 = models.FloatField()
    c2h4 = models.FloatField()

    graham_ratio = models.FloatField()
    graham_msg = models.TextField()
    young_ratio = models.FloatField()
    young_msg = models.TextField()
    coco2_ratio = models.FloatField()
    coco2_msg = models.TextField()
    jtr_ratio = models.FloatField()
    jtr_msg = models.TextField()
    chra_ratio = models.FloatField()
    chra_msg = models.TextField()

    explosm_result = models.TextField()

    date = models.DateField()

    class Meta:
        db_table = "Fire_exp_gases"
