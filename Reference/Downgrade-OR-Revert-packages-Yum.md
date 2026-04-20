Viewing the history of transactions

```bash
[root@test-ora-vm ~]#  yum history
ID     | Command line                                                                                     | Date and time    | Action(s)      | Altered
-------------------------------------------------------------------------------------------------------------------------------------------------------
   42 | upgrade tigervnc*                                                                                | 2025-05-07 12:09 | Upgrade        |    3
   41 | install xclock                                                                                   | 2025-02-25 15:06 | Install        |    1
   40 | install x11* xauth                                                                               | 2025-02-25 15:05 | Install        |   10
   3
```

Viewing details of a specific transaction

```bash
[root@test-ora-vm ~]#  yum history info 42
Transaction ID : 42
Begin time     : Wed 07 May 2025 12:09:03 PM IST
Begin rpmdb    : 5b0f1ba3657aedab32fc1209c6ebe4c4949956fdb8c11ce8e3aeb2c561d853f6
End time       : Wed 07 May 2025 12:09:07 PM IST (4 seconds)
End rpmdb      : 0258073714c2a00ca3abe315df11f7fae6d09309c0f4247dfaf090e2ab08f51e
User           : root <root>
Return-Code    : Success
Releasever     : 9
Command Line   : upgrade tigervnc*
Comment        :
Packages Altered:
   Upgrade  tigervnc-1.14.1-1.el9_5.1.x86_64         @ol9_appstream
   Upgraded tigervnc-1.14.1-1.el9_5.x86_64           @@System
   Upgrade  tigervnc-icons-1.14.1-1.el9_5.1.noarch   @ol9_appstream
   Upgraded tigervnc-icons-1.14.1-1.el9_5.noarch     @@System
   Upgrade  tigervnc-license-1.14.1-1.el9_5.1.noarch @ol9_appstream
   Upgraded tigervnc-license-1.14.1-1.el9_5.noarch   @@System
```

Checking the currently installed version of tigervnc packages

```bash
[root@test-ora-vm ~]# yum list installed|grep tigervnc
tigervnc.x86_64                                1.14.1-1.el9_5.1                    @ol9_appstream
tigervnc-icons.noarch                          1.14.1-1.el9_5.1                    @ol9_appstream
tigervnc-license.noarch                        1.14.1-1.el9_5.1                    @ol9_appstream
```

If you want to undo a transaction, you can use the `yum history undo` command followed by
the transaction ID.

```bash
[root@test-ora-vm ~]# yum history undo 42
Last metadata expiration check: 1:37:02 ago on Wed 07 May 2025 10:37:13 AM IST.
Dependencies resolved.
=======================================================================================================================================================
Package                                Architecture                 Version                                 Repository                           Size
=======================================================================================================================================================
Downgrading:
tigervnc                               x86_64                       1.14.1-1.el9_5                          ol9_appstream                       380 k
tigervnc-icons                         noarch                       1.14.1-1.el9_5                          ol9_appstream                        46 k
tigervnc-license                       noarch                       1.14.1-1.el9_5                          ol9_appstream                        17 k

Transaction Summary
=======================================================================================================================================================
Downgrade  3 Packages

Total download size: 442 k
Is this ok [y/N]: y
```


 