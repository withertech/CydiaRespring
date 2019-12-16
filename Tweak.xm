#include <spawn.h>
#include <signal.h>

%hook Cydia
- (void) reloadSpringBoard {

    pid_t pid;
    int status;
    const char *argv[] = {"killall", "SpringBoard", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)argv, NULL);
    waitpid(pid, &status, WEXITED);

}
%end

