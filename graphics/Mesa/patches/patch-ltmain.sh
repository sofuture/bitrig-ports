--- ltmain.sh.orig	Sat Jan 15 06:48:38 2000
+++ ltmain.sh	Tue Feb 20 16:24:03 2001
@@ -1079,7 +1079,18 @@ compiler."
 	    # These systems don't actually have c library (as such)
 	    continue
 	    ;;
+          *-*-openbsd*)
+            # Do not include libc due to us having libc/libc_r.
+            continue
+            ;;
 	  esac
+        elif test "$arg" = "-lc_r"; then
+          case "$host" in
+          *-*-openbsd*)
+            # Do not include libc_r directly, use -pthread flag.
+            continue
+            ;;
+          esac
 	elif test "$arg" = "-lm"; then
 	  case "$host" in
 	  *-*-cygwin* | *-*-beos*)
@@ -1091,6 +1102,10 @@ compiler."
 	deplibs="$deplibs $arg"
 	;;
 
+      -?thread)
+        deplibs="$deplibs $arg"
+        ;;
+
       -module)
 	module=yes
 	continue
@@ -1802,6 +1817,9 @@ compiler."
 	*-*-cygwin* | *-*-mingw* | *-*-os2* | *-*-beos*)
 	  # these systems don't actually have a c library (as such)!
 	  ;;
+        *-*-openbsd*)
+          # Do not include libc due to us having libc/libc_r.
+          ;;
 	*)
 	  # Add libc to deplibs on all other systems.
 	  deplibs="$deplibs -lc"
@@ -2626,7 +2644,7 @@ static const void *lt_preloaded_setup() 
 	  # linked before any other PIC object.  But we must not use
 	  # pic_flag when linking with -static.  The problem exists in
 	  # FreeBSD 2.2.6 and is fixed in FreeBSD 3.1.
-	  *-*-freebsd2*|*-*-freebsd3.0*|*-*-freebsdelf3.0*)
+	  *-*-freebsd2*|*-*-freebsd3.0*|*-*-freebsdelf3.0*)
 	    case "$compile_command " in
 	    *" -static "*) ;;
 	    *) pic_flag_for_symtable=" $pic_flag -DPIC -DFREEBSD_WORKAROUND";;
@@ -3562,40 +3580,6 @@ libdir='$install_libdir'\
     # Exit here if they wanted silent mode.
     test "$show" = : && exit 0
 
-    echo "----------------------------------------------------------------------"
-    echo "Libraries have been installed in:"
-    for libdir in $libdirs; do
-      echo "   $libdir"
-    done
-    echo
-    echo "If you ever happen to want to link against installed libraries"
-    echo "in a given directory, LIBDIR, you must either use libtool, and"
-    echo "specify the full pathname of the library, or use \`-LLIBDIR'"
-    echo "flag during linking and do at least one of the following:"
-    if test -n "$shlibpath_var"; then
-      echo "   - add LIBDIR to the \`$shlibpath_var' environment variable"
-      echo "     during execution"
-    fi
-    if test -n "$runpath_var"; then
-      echo "   - add LIBDIR to the \`$runpath_var' environment variable"
-      echo "     during linking"
-    fi
-    if test -n "$hardcode_libdir_flag_spec"; then
-      libdir=LIBDIR
-      eval flag=\"$hardcode_libdir_flag_spec\"
-
-      echo "   - use the \`$flag' linker flag"
-    fi
-    if test -n "$admincmds"; then
-      echo "   - have your system administrator run these commands:$admincmds"
-    fi
-    if test -f /etc/ld.so.conf; then
-      echo "   - have your system administrator add LIBDIR to \`/etc/ld.so.conf'"
-    fi
-    echo
-    echo "See any operating system documentation about shared libraries for"
-    echo "more information, such as the ld(1) and ld.so(8) manual pages."
-    echo "----------------------------------------------------------------------"
     exit 0
     ;;
 
