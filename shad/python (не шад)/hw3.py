def bisect(a, x, lo=0, hi=-1):
    if lo < 0:
        raise ValueError
    if hi < 0:
        hi += len(a)+1
    while lo < hi:
        m = lo + (hi-lo)//2
        if a[m] <= x:
            lo = m + 1
        else:
            hi = m
    return hi
bisect.__doc__ = "Documentation"
