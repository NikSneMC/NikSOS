{lib, ...}:
# personal lib
{
  _module.args = {
    colors = import ./theme lib;
  };
}