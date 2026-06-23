# (C) IKA Studios. All Rights Reserved

import Host
import GigiArray
import numpy
from PIL import Image
import os
import subprocess

resources = [
    "Playground.Output: Output (UAV - After)"
]

Host.DisableGGUserSave(True)

# make sure the output directory exists
outDirName = "C:/Users/Owi/Documents/gigi/ComputePlayground/ToVideo"
os.makedirs(outDirName, exist_ok=True)

videoPath = os.path.join(outDirName, "Output.mp4")

frames = []
fps = 120
frameCount = fps * 3

# Load the technique
if not Host.LoadGG("ComputePlayground.gg"):
    print("failed to load")
else:

    Host.SetFrameIndex(0)
    Host.SetFrameDeltaTime(1.0 / 120.0)

    # Do one execution to ensure everything is initialized
    Host.RunTechnique()

    # Say that we want readback of this buffer
    for resource in resources:
	    Host.SetWantReadback(resource)

    for frameIdx in range(frameCount):
        Host.SetFrameIndex(frameIdx)
        Host.RunTechnique()
        Host.WaitOnGPU()

        for i, resource in enumerate(resources):
            lastReadback, success = Host.Readback(resource)

            if not success:
                Host.Log("Error", f"Readback failed on frame {frameIdx}")
                continue

        lastReadbackNp = numpy.array(lastReadback)

        if resource:
            lastReadbackNp = lastReadbackNp.reshape((lastReadbackNp.shape[1], lastReadbackNp.shape[2], lastReadbackNp.shape[3]))

            frameFileName = os.path.join(outDirName, f"frame_{frameIdx:04d}.png")

            Image.fromarray(lastReadbackNp, "RGBA").save(frameFileName)

ffmpegCmd = [
    "ffmpeg",
    "-y",
    "-framerate", str(fps),
    "-i", os.path.join(outDirName, "frame_%04d.png"),
    "-c:v", "libx264",
    "-pix_fmt", "yuv420p",
    videoPath
]

try:
    subprocess.run(ffmpegCmd, check=True)
except subprocess.CalledProcessError as e:
    Host.Log("Error", f"FFmpeg failed: {e}")
except FileNotFoundError:
    Host.Log("Error", "FFmpeg was not found. Make sure ffmpeg is installed and added to PATH.")

Host.Log("Info", f"Saved video to {videoPath}")

#imageio.mimsave(videoPath, frames, fps=fps)

Host.Log("Info", f"Saved video to {videoPath}")