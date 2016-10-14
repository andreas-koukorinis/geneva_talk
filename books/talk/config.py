import os
BASEPATH = os.path.dirname(os.path.dirname(__file__))

from pandas import options
options.display.mpl_style = 'default'

def config_mosek():
    print("Set MOSEKLM_LICENSE_FILE environment variable")    
    os.environ["MOSEKLM_LICENSE_FILE"] = os.path.join(BASEPATH, "license", "mosek.lic")
    
def config_configManager():
    print("Update ConfigManager")
    from notebook.services.config import ConfigManager
    cm = ConfigManager()
    cm.update('livereveal', {
              'theme': 'serif',
              'start_slideshow_at': 'selected',
              'width': 1680,
              'height': 768,
    })


def config_matplotlib():
    import matplotlib.pyplot as plt

    params = {'legend.fontsize': 'large', 
              'lines.linewidth':3, 
              'font.size':16, 
              'axes.labelsize':'large', 
              'axes.labelcolor':'black', 
              'xtick.labelsize':'large', 
              'ytick.labelsize':'large', 
              'figure.figsize':(20, 6)}

    plt.rcParams.update(params)