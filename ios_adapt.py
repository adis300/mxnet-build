import os

lib_path = os.path.abspath(os.path.dirname(__file__))

fname = "mxnet/amalgamation/mxnet_predict-all.cc"

cc_text = open(fname).read()

cc_text = cc_text.replace("#include <cblas.h>", "#include <Accelerate/Accelerate.h>")
cc_text = cc_text.replace("#include <emmintrin.h>", "//#include <emmintrin.h>")
cc_text = cc_text.replace("#if defined(__ANDROID__) || defined(__MXNET_JS__)\n#define MSHADOW_USE_SSE         0\n#endif", "#define MSHADOW_USE_SSE         0", 1)
cc_text = cc_text.replace("#ifdef __GNUC__\n  #define MX_THREAD_LOCAL __thread\n#elif __STDC_VERSION__ >= 201112L\n  #define  MX_THREAD_LOCAL _Thread_local\n#elif defined(_MSC_VER)\n  #define MX_THREAD_LOCAL __declspec(thread)\n#endif", "#define MX_TREAD_LOCAL __declspec(thread)", 1)
cc_text = cc_text.replace("void dposv_", "int dposv_")
cc_text = cc_text.replace("void sposv_", "int sposv_")
cc_text = cc_text.replace("void func##_", "int func##_")

modified_source = open(fname, 'w')
modified_source.write(cc_text)
