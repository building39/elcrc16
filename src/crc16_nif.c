#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "erl_nif.h"

extern int crcFast(unsigned char const message[], int len);
extern int crcInit();

static ERL_NIF_TERM crc16(ErlNifEnv* env,
                          int argc,
                          ERL_NIF_TERM argv[])
{
    ErlNifBinary binary;
    int data_size = 0;
    unsigned char *data = NULL;
    if (argc !=1 || !enif_inspect_binary(env, argv[0], &binary)) {
        return enif_make_badarg(env);
    }
    data_size = binary.size;
    data = binary.data;
    return enif_make_int(env, crcFast(data, data_size));
}
static ErlNifFunc nif_funcs[] =
{
    {"crc16", 1, crc16}
};
ERL_NIF_INIT(Elixir.Elcrc16, nif_funcs, NULL, NULL, NULL, NULL)

