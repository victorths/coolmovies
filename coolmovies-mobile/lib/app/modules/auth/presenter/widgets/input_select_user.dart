import 'package:coolmovies/app/commons/utils/exports.dart';

class InputSelectUser extends StatefulWidget {
  const InputSelectUser({
    Key? key,
    required this.users,
    required this.onSelectUser,
  }) : super(key: key);

  final List<UserEntity> users;
  final void Function(UserEntity?) onSelectUser;

  @override
  State<InputSelectUser> createState() => _InputSelectUserState();
}

class _InputSelectUserState extends State<InputSelectUser> {
  UserEntity? selectedUser;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<UserEntity>(
        decoration: InputDecoration(
          label: Text(
            selectedUser == null ? 'Select an User' : 'Selected User',
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.background,
            ),
          ),
        ),
        isExpanded: true,
        value: selectedUser,
        items: widget.users
            .map((e) => DropdownMenuItem<UserEntity>(
                  value: e,
                  child: Text(e.name),
                ))
            .toList(),
        onChanged: (value) {
          selectedUser = value;
          widget.onSelectUser(value);
        },
      ),
    );
  }
}
