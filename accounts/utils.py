def is_manager(user):
    return user.groups.filter(name='Level1').exists()