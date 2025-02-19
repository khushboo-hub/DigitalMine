import os

from django.db import models
from django.dispatch import receiver
from django.urls import reverse
from employee.models import MineDetails
from django.utils import timezone
from datetime import datetime

class gasModel_auto(models.Model):
    mine_id = models.IntegerField()
    node_id = models.IntegerField()
    sensor_name = models.CharField(max_length=10, default='Null')
    sensor_id = models.IntegerField()
    sensor_value = models.FloatField(null=True)
    date_time = models.DateTimeField(default=timezone.now)

    class Meta:
        db_table = "gasmodel_auto"


class Node(models.Model):
    id = models.AutoField(primary_key=True)
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE)
    #selectmine = models.CharField('Select Mine',default='Null', max_length=200)
    node_id = models.CharField('Node ID', max_length=200)
    name = models.CharField('Name', max_length=200)
    location = models.CharField('Location', default='Null', max_length=200)
    # ip_add= models.CharField('IP Address', max_length=200)
    x_axis = models.FloatField('X Axis')
    y_axis = models.FloatField('Y Axis')
    photo1 = models.ImageField(upload_to='emp_img/', null=True, blank=True)
    photo2 = models.ImageField(upload_to='emp_img/', null=True, blank=True)
    description = models.TextField('Description', max_length=200)
    isgoaf = models.BooleanField(null=False,default=False)

    class Meta:
        unique_together = ('mine_id', 'node_id')

    def __str__(self):
          return (self.name)

    def get_absolute_url(self):
        return reverse('node:node_edit', kwargs={'pk': self.pk})

#=======================================================Dated 2020_06_01 : shyam
# class Sensor(models.Model):
#     id = models.AutoField(primary_key=True)
#     arduino_id = models.IntegerField(null=True, blank=True)
#     wireless_id = models.IntegerField(null=True, blank=True)
#     sensorid = models.CharField('Sensor Id', max_length=200)
#     sensorname = models.CharField('Sensor Name', max_length=200)
#     minrange = models.IntegerField('Min Range')
#     maxrange = models.IntegerField('Max Range')
#     sensorunit = models.CharField('Sensor Unit', max_length=200)
#     thresholdlimit = models.CharField('Threshold Limit', default='0', max_length=200)
#     greenlevel = models.CharField('Green Level Limit', default='0', max_length=200)
#     yellowlevel = models.CharField('Yellow Level Limit', default='0', max_length=200)
#     redlevel = models.CharField('Red Level Limit', default='0', max_length=200)
#     photo = models.ImageField(upload_to='emp_img/', null=True, blank=True)
#
#
#     def __str__(self):
#         return(self.sensorid)
#
#
#     def get_absolute_url(self):
#         return reverse('sensor:sensor_edit', kwargs={'pk': self.pk})

class Sensor_Node(models.Model):
    # mine_id = models.IntegerField(null=True, blank=True)
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE)
    # node_id = models.IntegerField(null=True, blank=True)
    node_id = models.ForeignKey(Node, on_delete=models.CASCADE)
    ip_add = models.CharField('IP Addressss', max_length=200)
    sensor_id = models.CharField('Sensor Id', max_length=200)

    GAS_SENSOR_CHOICES = (
        ('CO', 'CO'),
        ('CO2', 'CO2'),
        ('CH4','CH4'),
        ('O2','O2'),
        ('H2','H2'),
        ('N2','N2'),
        ('C2H4','C2H4')
    )

    sensor_name = models.CharField('Sensor Name', max_length=200,choices=GAS_SENSOR_CHOICES)
    sensor_unit = models.CharField('Sensor Unit', max_length=200)
    sensor_threshold_limit = models.CharField('Threshold Limit', default='0', max_length=200)

    level_1_warning_unit = models.IntegerField('Sensor Level 1',default=0)
    level_2_warning_unit = models.IntegerField('Sensor Level 2',default=0)
    level_3_warning_unit = models.IntegerField('Sensor Level 3',default=0)
    level_1_color = models.CharField('Green Level Limit',max_length=50, null=True, blank=True, default='#ADFF2F')  ## Default Green Color
    level_2_color = models.CharField('Yellow Level Limit',max_length=50, null=True, blank=True, default='#FFA500')  ## Default Orange Color
    level_3_color = models.CharField('Red Level Limit',max_length=50, null=True, blank=True, default='#FF0000')  ## Default Red Color
    level_1_msg = models.CharField(max_length=200, null=True, blank=True,
                                   default='Environment Sensor Condition:First Stage Warning Message , Please be Careful.')
    level_2_msg = models.CharField(max_length=200, null=True, blank=True,
                                   default='Environment Sensor Condition:Second Stage Warning Message , Please be alert situation is not good.')
    level_3_msg = models.CharField(max_length=200, null=True, blank=True,
                                   default='Environment Sensor Condition:Third Stage Warning Message , Please  leave the underground')

    level_1_audio = models.FileField(upload_to='environment_sensor_warning_audio/', null=True, blank=True)
    level_2_audio = models.FileField(upload_to='environment_sensor_warning_audio/', null=True, blank=True)
    level_3_audio = models.FileField(upload_to='environment_sensor_warning_audio/', null=True, blank=True)
    interval_time = models.IntegerField(null=True, blank=True, default='30')
    audio_play_type = models.CharField(max_length=10, default='mp3only')

    description = models.TextField('Description', max_length=200)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(auto_now=True)
    class Meta:
        db_table = "sensor_sensor_node"
        unique_together = ('mine_id','node_id','sensor_id')


#=========================================================== Dated : 2020_06_01 : shyam
# class Wireless(models.Model):
#     node_id = models.IntegerField(null=True, blank=True)
#     id = models.AutoField(primary_key=True)
#     ipaddress = models.CharField('IP Address', max_length=200)
#     name = models.CharField('Name', max_length=200,default='N/A')
#
#     # nodeid = models.ForeignKey(
#     #     Node, on_delete=models.CASCADE, null=True, blank=True)
#     def __str__(self):
#         return (self.name)
#
#         # return str(self.wireless_id) + "-" + str(self.ipaddress)
#
#     def get_absolute_url(self):
#         return reverse('wireless:wireless_edit', kwargs={'pk': self.pk})
#
# class Nodesensor(models.Model):
#     id = models.AutoField(primary_key=True)
#     #nodeid = models.CharField('Node ID', max_length=200)
#     name = models.ForeignKey(
#         Node,  on_delete=models.CASCADE, null=True, blank=True)
#     sensorid = models.ForeignKey(
#         Sensor, related_name='sensor_id', on_delete=models.CASCADE, null=True, blank=True)
#     nodesensorname = models.CharField(max_length=200)
#     #sensorname = models.ForeignKey(
#         #Sensor, related_name='sensor_name' , on_delete=models.CASCADE, null=True, blank=True)
#     thresholdvalue = models.CharField('Threshold Value', max_length=200)
#     alertcolourpriority = models.CharField('Alert Colour Priority', max_length=200)
#     description = models.TextField('Description', max_length=200)
#     created_date = models.DateTimeField(default=timezone.now)
#     modified_date = models.DateTimeField(blank=True, null=True)
#
#     def __str__(self):
#         return self.name
#
#     def get_absolute_url(self):
#         return reverse('nodesensor:nodesensor_edit', kwargs={'pk': self.pk})
#
# class Sensordata(models.Model):
#     temp = models.CharField(max_length=200, default=0)
#     pressure = models.CharField(max_length=200, default=0)
#     date = models.DateField(default=timezone.now)
#
#     def __str__(self):
#         return self.value


################# Reciever for_Node #################
@receiver(models.signals.post_delete, sender=Node)
def auto_delete_file_on_delete(sender, instance, **kwargs):
    """
    Deletes file from filesystem
    when corresponding `MediaFile` object is deleted.
    """
    if instance.photo1:
        if os.path.isfile(instance.photo1.path):
            os.remove(instance.photo1.path)
    if instance.photo2:
        if os.path.isfile(instance.photo2.path):
            os.remove(instance.photo2.path)

@receiver(models.signals.pre_save, sender=Node)
def auto_delete_file_on_change(sender, instance, **kwargs):
    """
    Deletes old file from filesystem
    when corresponding `MediaFile` object is updated
    with new file.
    """
    if not instance.pk:
        return False

    try:
        node = Node.objects.get(pk=instance.pk)
        old_file1 = node.photo1
        old_file2 = node.photo2
    except Node.DoesNotExist:
        return False

    new_file = instance.photo1
    if not old_file1 == new_file:
        if os.path.isfile(old_file1.path):
            os.remove(old_file1.path)
    new_file = instance.photo2
    if not old_file2 == new_file:
        if os.path.isfile(old_file2.path):
            os.remove(old_file2.path)

################# Reciever for Node END #################

################# Reciever for Node #################
@receiver(models.signals.post_delete, sender=Sensor_Node)
def auto_delete_file_on_delete(sender, instance, **kwargs):
    """
    Deletes file from filesystem
    when corresponding `MediaFile` object is deleted.
    """
    if instance.level_1_audio:
        if os.path.isfile(instance.level_1_audio.path):
            os.remove(instance.level_1_audio.path)
    if instance.level_2_audio:
        if os.path.isfile(instance.level_2_audio.path):
            os.remove(instance.level_2_audio.path)
    if instance.level_3_audio:
        if os.path.isfile(instance.level_3_audio.path):
            os.remove(instance.level_3_audio.path)

@receiver(models.signals.pre_save, sender=Sensor_Node)
def auto_delete_file_on_change(sender, instance, **kwargs):
    """
    Deletes old file from filesystem
    when corresponding `MediaFile` object is updated
    with new file.
    """
    if not instance.pk:
        return False

    try:
        sensornode = Sensor_Node.objects.get(pk=instance.pk)
        old_file1 = sensornode.level_1_audio
        old_file2 = sensornode.level_2_audio
        old_file3 = sensornode.level_3_audio
    except Node.DoesNotExist:
        return False

    new_file = instance.level_1_audio
    if not old_file1 == new_file:
        if os.path.isfile(old_file1.path):
            os.remove(old_file1.path)

    new_file = instance.level_2_audio
    if not old_file2 == new_file:
        if os.path.isfile(old_file2.path):
            os.remove(old_file2.path)

    new_file = instance.level_3_audio
    if not old_file3 == new_file:
        if os.path.isfile(old_file3.path):
            os.remove(old_file3.path)
################# Reciever for Sensor Node END #################

