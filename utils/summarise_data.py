import numpy as np

def summarise_values(d):
    return np.sum(np.abs(d))

def summarise_ds(ds1, ds2=None):
    sets = {}
    for ds in [ds1, ds2]:
        if not ds is None:
            for (d, l) in ds:
                l = str(l)
                if not l in sets:
                    sets[l] = np.empty((0),dtype=np.float32)
                sets[l] = np.append(sets[l], summarise_values(d))
    summary = {}
    for l in sets:
        v = sets[l]
        summary[l] = (len(v), np.mean(v), np.std(v))
    return summary

def report_ds(title, ds1, ds2=None):
    print("SET: {}".format(title))
    s = summarise_ds(ds1, ds2)
    print("count: {}".format(len(s)))
    for l in sorted(s):
        v = s[l]
        print("{}: c={} m={} sd={}".format(l, v[0], v[1], v[2]))

def summarise_data(train_ds, val_ds):
    report_ds('train', train_ds)
    report_ds('val', val_ds)
    report_ds('combined', train_ds, val_ds)
