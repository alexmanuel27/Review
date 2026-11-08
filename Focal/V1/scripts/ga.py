import sys, matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from PIL import Image
plt.rcParams.update({"font.family":"DejaVu Sans","font.size":12})
disp, out = sys.argv[1], sys.argv[2]
# Totals from Table II (all 111 studies)
labels=["Reference comparison","Quantified agreement","Held-out samples","Real matrices","Repeatability","Numerical cost","Open files"]
counts=[88,60,51,61,52,56,30]
pct=[100*c/111 for c in counts]
fig=plt.figure(figsize=(18/2.54*1.6,8/2.54*1.6))
ax=fig.add_axes([0.19,0.16,0.24,0.66])
y=range(len(labels))[::-1]
ax.barh(list(y),pct,color="#4C72B0",height=0.65)
for yi,p,c in zip(y,pct,counts): ax.text(p+1.5,yi,f"{c}",va="center",fontsize=11)
ax.set_yticks(list(y)); ax.set_yticklabels(labels); ax.set_xlim(0,100)
ax.set_xlabel("Studies documenting it (% of 111)")
for s in ["top","right"]: ax.spines[s].set_visible(False)
ax.set_title("What 111 low-cost instrument\nstudies documented",fontsize=13,fontweight="bold",loc="left",x=-0.62)
ax2=fig.add_axes([0.45,0.12,0.54,0.72]); ax2.imshow(Image.open(disp)); ax2.axis("off")
fig.text(0.47,0.88,"Three instruments, one protocol:\nvalidation dyes, 400–700 nm",fontsize=13,fontweight="bold",va="bottom")
fig.text(0.47,0.04,"A: AS7265x chip   B: Raspberry Pi + spectroscope   C: webcam",fontsize=11)
fig.savefig(out,dpi=300)
