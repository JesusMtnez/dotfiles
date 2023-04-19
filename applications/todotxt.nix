{ latestPkgs, ... }:
{
  home.packages = [ latestPkgs.todo-txt-cli ];

  home.file.".todo/config".text =
    ''
      export TODO_DIR=$HOME/syncthing/jesus/apps/todo.txt
      export TODO_FILE=$TODO_DIR/personal.todo.txt
      export DONE_FILE=$TODO_DIR/personal.archive.todo.txt
    '';
}
