{ inputs, ... }:
{
    providesInput = name: {
        assertion = inputs ? ${name};
        message = ''
            Must provide module named "${name}" in inputs.
        '';
    };
}
