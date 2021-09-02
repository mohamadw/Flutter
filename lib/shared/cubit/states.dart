

abstract class TodoStates {}

class TodoInitialState extends TodoStates{}
class ChangeNavigateBarIndexState extends TodoStates{}



class ChangeBottomSheetState extends TodoStates{}


class TodoLoadingState extends TodoStates{}


//DataBase States
class CreateDBState extends TodoStates{}
class OpenDBState extends TodoStates{}
class UpdateDBState extends TodoStates{}
class InsertDBState extends TodoStates{}
class GetDBState extends TodoStates{}
class DeleteDBState extends TodoStates{}
