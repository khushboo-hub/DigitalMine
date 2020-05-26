from django.db import models
from django.urls import reverse
from django.utils import timezone
from employee.models import MineDetails

from django.utils import timezone


class gasModel_auto(models.Model):
    mine_id = models.IntegerField()
    node_id = models.IntegerField()
    gas_name= models.CharField(max_length=10, default='Null')
    gas_value = models.CharField(max_length=50, default='Null')
    date_time = models.DateTimeField(default=timezone.now)

    class Meta:
        db_table = "gasmodel_auto"


class Node(models.Model):
    id = models.AutoField(primary_key=True)
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE)
    #selectmine = models.CharField('Select Mine',default='Null', max_length=200)
    nodeid = models.CharField('Node ID', max_length=200)
    name = models.CharField('Name', max_length=200)
    location = models.CharField('Location', default='Null', max_length=200)
    # ip_add= models.CharField('IP Address', max_length=200)
    x_axis = models.FloatField('X Axis')
    y_axis = models.FloatField('Y Axis')
    photo1 = models.ImageField(upload_to='emp_img/', null=True, blank=True)
    photo2 = models.ImageField(upload_to='emp_img/', null=True, blank=True)
    description = models.TextField('Description', max_length=200)
    # mine = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)

    # CONNECTIVITY_CHOICES = (
    #     ('WL', 'Wireless'),
    #     ('W', 'Wired')
    # )
    # connection = models.CharField(choices=CONNECTIVITY_CHOICES, max_length=128, null=True, blank=True)

    def __str__(self):
          return (self.name)

    def get_absolute_url(self):
        return reverse('node:node_edit', kwargs={'pk': self.pk})

class Sensor(models.Model):
    id = models.AutoField(primary_key=True)
    arduino_id = models.IntegerField(null=True, blank=True)
    wireless_id = models.IntegerField(null=True, blank=True)
    sensorid = models.CharField('Sensor Id', max_length=200)
    sensorname = models.CharField('Sensor Name', max_length=200)
    minrange = models.IntegerField('Min Range')
    maxrange = models.IntegerField('Max Range')
    sensorunit = models.CharField('Sensor Unit', max_length=200)
    thresholdlimit = models.CharField('Threshold Limit', default='0', max_length=200)
    greenlevel = models.CharField('Green Level Limit', default='0', max_length=200)
    yellowlevel = models.CharField('Yellow Level Limit', default='0', max_length=200)
    redlevel = models.CharField('Red Level Limit', default='0', max_length=200)
    photo = models.ImageField(upload_to='emp_img/', null=True, blank=True)


    def __str__(self):
        return(self.sensorid)


    def get_absolute_url(self):
        return reverse('sensor:sensor_edit', kwargs={'pk': self.pk})

class Sensor_Node(models.Model):
    id = models.AutoField(primary_key=True)
    # mine_id = models.IntegerField(null=True, blank=True)
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE)
    # node_id = models.IntegerField(null=True, blank=True)
    node_id = models.ForeignKey(Node, on_delete=models.CASCADE)
    ip_add = models.CharField('IP Addressss', max_length=200)
    sensorid = models.CharField('Sensor Id', max_length=200)
    sensorname = models.CharField('Sensor Name', max_length=200)
    sensorunit = models.CharField('Sensor Unit', max_length=200)
    thresholdlimit = models.CharField('Threshold Limit', default='0', max_length=200)
    sensorunit1 = models.CharField('Sensor Unit1', max_length=200)
    sensorunit2 = models.CharField('Sensor Unit2', max_length=200)
    sensorunit3 = models.CharField('Sensor Unit3', max_length=200)
    sensormsg1 = models.CharField('sensor Msg1', max_length=200)
    sensormsg2 = models.CharField('sensor Msg1', max_length=200)
    sensormsg3 = models.CharField('sensor Msg1', max_length=200)
    greenlevel = models.CharField('Green Level Limit', default='0', max_length=200)
    yellowlevel = models.CharField('Yellow Level Limit', default='0', max_length=200)
    redlevel = models.CharField('Red Level Limit', default='0', max_length=200)
    description = models.TextField('Description', max_length=200)
    class Meta:
        db_table="sensor_sensor_node"
        unique_together = ('mine_id','node_id','sensorid')


class Wireless(models.Model):
    node_id = models.IntegerField(null=True, blank=True)
    id = models.AutoField(primary_key=True)
    ipaddress = models.CharField('IP Address', max_length=200)
    name = models.CharField('Name', max_length=200,default='N/A')

    # nodeid = models.ForeignKey(
    #     Node, on_delete=models.CASCADE, null=True, blank=True)
    def __str__(self):
        return (self.name)

        # return str(self.wireless_id) + "-" + str(self.ipaddress)

    def get_absolute_url(self):
        return reverse('wireless:wireless_edit', kwargs={'pk': self.pk})

class Nodesensor(models.Model):
    id = models.AutoField(primary_key=True)
    #nodeid = models.CharField('Node ID', max_length=200)
    name = models.ForeignKey(
        Node,  on_delete=models.CASCADE, null=True, blank=True)
    sensorid = models.ForeignKey(
        Sensor, related_name='sensor_id', on_delete=models.CASCADE, null=True, blank=True)
    nodesensorname = models.CharField(max_length=200)
    #sensorname = models.ForeignKey(
        #Sensor, related_name='sensor_name' , on_delete=models.CASCADE, null=True, blank=True)
    thresholdvalue = models.CharField('Threshold Value', max_length=200)
    alertcolourpriority = models.CharField('Alert Colour Priority', max_length=200)
    description = models.TextField('Description', max_length=200)
    created_date = models.DateTimeField(default=timezone.now)
    modified_date = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('nodesensor:nodesensor_edit', kwargs={'pk': self.pk})

class Sensordata(models.Model):
    temp = models.CharField(max_length=200, default=0)
    pressure = models.CharField(max_length=200, default=0)
    date = models.DateField(default=timezone.now)

    def __str__(self):
        return self.value
