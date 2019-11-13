from django.db import models

class Gasdb(models.Model):
    o2 = models.FloatField()
    co = models.FloatField()
    ch4 = models.FloatField()
    co2 = models.FloatField()
    h2 = models.FloatField()
    n2 = models.FloatField()
    c2h4 = models.FloatField()
    date = models.DateField()

##    def __str__(self):
##        return self.title
    class Meta:
        db_table="Fire_Exp_Manual"


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
        db_table="Fire_exp_gases"