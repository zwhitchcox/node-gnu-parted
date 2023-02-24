// @ts-ignore
import api from './parted'

let initialized = false;
export async function parted(device: string, size: number, script: string) {
  if (!initialized) {
    await new Promise<void>(res => {
      api.onRuntimeInitialized = () => {
        initialized = true;
        res()
      }
    })
  }
  api.ccall("api", "number",
    ["string", "string", "number"],
    [device, script, size/512])
}
