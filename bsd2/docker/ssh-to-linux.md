When using a bare linux box to run docker the following ssh cmd should be used to connect to the box:

ssh -L:8888:localhost:8888 <user>@<linuxhost.domain>

Once connected you should be able to see IPython Notebook at http://localhost:8888 *back on your laptop/desktop* from which you are connecting to the linux box.
