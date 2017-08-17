def plotter():
    import matplotlib.pyplot as plt
    import seaborn as sns

    plt.style.use('scaled')
    plt.ion()

    def despiner(f):
        def fp(*args,**kwargs):
            f(*args, **kwargs)
            sns.despine()
        return fp

    for n in ['plot', 'scatter', 'bar']:
        setattr(plt, n, despiner(getattr(plt, n)))

    return plt
