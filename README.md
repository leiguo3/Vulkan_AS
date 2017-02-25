# Vulkan_Android_Studio
Sascha Willems' Vulkan demos run with Android Studio


Known issues:

1. NDK build fails with long project path on windows<br />
https://code.google.com/p/android/issues/detail?id=75360<br />
error info:<br />
error: error opening '.../.../xxx.o.d': No such file or directory<br />
workaround: make the project path short, such as put the folder of Vulkan_Android_Studio under root (e.g., D:)<br />
