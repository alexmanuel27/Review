import sys, matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
plt.rcParams["font.family"]="Liberation Serif"
out=sys.argv[1]
fig,ax=plt.subplots(figsize=(8,5.75)); ax.set_xlim(0,640); ax.set_ylim(460,0); ax.axis("off")
def box(x,y,w,h,txt,bold=False,size=13.5):
    ax.add_patch(Rectangle((x,y),w,h,fill=False,lw=0.9,ec="black"))
    ax.text(x+w/2,y+h/2,txt,ha="center",va="center",fontsize=size,fontweight="bold" if bold else "normal",linespacing=1.25)
def line(xs,ys): ax.plot(xs,ys,color="black",lw=0.9)
box(135,15,370,70,"138 documents cited in the review",bold=True,size=15)
line([320,320],[85,112]); line([158,485],[112,112]); line([158,158],[112,140]); line([485,485],[112,140])
box(30,140,255,65,"111 device studies analyzed",bold=True)
box(355,140,260,65,"27 supporting documents",bold=True)
line([158,158],[205,240])
box(30,240,255,175,"Six hardware families\n\nLED / colorimeter: 28\nSmartphone grating: 29\nCamera grating: 4\nIntegrated module: 9\nMultispectral chip: 34\nOther: 7",size=13)
line([485,485],[205,225]); line([330,485],[225,225]); line([330,330],[225,395])
for y,t in [(240,"15 sources from the\nliterature search"),(310,"7 contextual or\nmethodological references"),(370,"5 technical documents")]:
    h=55 if y<370 else 50
    box(352,y,265,h,t,size=13); line([330,352],[y+h/2,y+h/2])
fig.savefig(out,bbox_inches="tight",pad_inches=0.05)
