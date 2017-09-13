def plotter(theme=['scaled']):
    import matplotlib as mpl
    import seaborn as sns

    mpl.style.use(theme)
    mpl.interactive(True)

    def despiner(f):
        def fp(*args, **kwargs):
            dsp = kwargs.pop('despine', True)
            ret = f(*args, **kwargs)
            if dsp:
                sns.despine()
            return ret
        return fp

    for n in ['plot', 'scatter', 'bar']:
        setattr(mpl.axes.Axes, n, despiner(getattr(mpl.axes.Axes, n)))
