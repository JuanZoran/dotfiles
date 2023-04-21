#include <iostream>
#include <lua5.3/lua.hpp>

using namespace std;

static int add(lua_State *L) {
  auto a = lua_tonumber(L, 1);
  auto b = lua_tonumber(L, 2);
  lua_pushnumber(L, a + b);
  return 1;
}

LUAMOD_API int luaopen_lib_cpp_add(lua_State *L) {
  luaL_Reg loadadd[] = {{"add", add}, {NULL, NULL}};

  luaL_newlib(L, loadadd);
  return 1;
}