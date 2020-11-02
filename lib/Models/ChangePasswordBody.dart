class ChangePasswordBody{
  String user_id;
  String old_password;
  String new_password;

  ChangePasswordBody({this.user_id, this.old_password, this.new_password});
}