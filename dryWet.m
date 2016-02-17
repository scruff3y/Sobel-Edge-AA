% Does a dry/wet combination of two variables.

function combined = dryWet(dry, wet, percent)
    combined = dry.*(1-percent) + wet.*percent;
end
