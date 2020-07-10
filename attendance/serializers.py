from rest_framework import serializers
from attendance.models import SetAttendanceFromAPIModel

class AttendanceSerializer(serializers.ModelSerializer):
    class Meta:
        model = SetAttendanceFromAPIModel
        fields = "__all__"