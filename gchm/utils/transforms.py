import numpy as np
class Normalize(object):
    """ Normalize tensor with mean and std. """

    def __init__(self, mean, std):
        self.mean = mean
        self.std = std

    def __call__(self, x):
        if x.shape[-1] < 2:
            slice = x[0, :, :, 0]
            #print('slice', slice)
        x = x - self.mean
        x = x / self.std
        avg_non_na = np.nanmean(x)
        print('Average of non-NA values:', avg_non_na)
        return x


class NormalizeVariance(object):
    """ Normalize variance tensor with std. """

    def __init__(self, std):
        self.var = std ** 2

    def __call__(self, x):
        x = x / self.var
        return x


def denormalize(x, mean, std):
    """ Denormalize normalized numpy array with mean and std. """
    x = x * std
    x = x + mean
    return x


def denormalize_variance(x, std):
    """ Denormalize normalized numpy array (representing a variance) with std. """
    x = x * std ** 2
    return x

