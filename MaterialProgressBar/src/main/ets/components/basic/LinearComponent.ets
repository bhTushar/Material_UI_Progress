/*
 * Copyright (C) 2022 Application Library Engineering Group
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import LinearPath from './LinearPath'

@Component
export default struct LinearComponent {
  private progressBar: LinearPath
  private width: string = '0vp'
  private height: string = '0vp'
  private strokeWidth = '6vp'
  private strokewidth_a: number = parseInt(this.strokeWidth.substr(0, this.strokeWidth.length - 2))
  private progressMax: number = 100
  private bgColor: Color = null;
  private color: Color = 0x029789
  @Prop @Watch("watchProgress") progress: number
  private secondColor: Color = null
  @State secondProgress: number = 0
  @State offset: number = 0
  @State private bgPathCmd: string = ''
  @State private progressPathCmd: string = ''
  @State private secondProgressPathCmd: string = ''

  aboutToAppear() {
    this.width = (this.progressMax).toString()
    this.height = (this.strokeWidth)
    this.progressBar = new LinearPath()
      .setMaxProgress(this.progressMax)
      .setBarColor(this.color)
      .setProgress(this.progress)
    this.progressPathCmd = this.progressBar.getPathCmd()

    if (this.bgColor) {
      let bgBar = new LinearPath()
        .setMaxProgress(this.progressMax)
        .setBarColor(this.color)
        .setProgress(this.progressMax)
      this.bgPathCmd = bgBar.getPathCmd()
    }

    if (this.secondColor) {
      let secondBar = new LinearPath()
        .setMaxProgress(this.progressMax)
        .setBarColor(this.color)
        .setProgress(this.secondProgress)
      this.secondProgressPathCmd = secondBar.getPathCmd()
    }

  }

  watchProgress() {
    this.progressBar.setOffset(this.offset)
    this.progressBar.setProgress(this.progress)
    this.progressPathCmd = this.progressBar.getPathCmd()
  }

  build() {
    Shape() {
      if (this.bgColor) {
        Path()
          .commands(this.bgPathCmd)
          .stroke(this.bgColor)
          .strokeWidth(this.strokeWidth)
      }

      if (this.secondColor) {
        Path()
          .commands(this.secondProgressPathCmd)
          .stroke(this.secondColor)
          .strokeWidth(this.strokeWidth)
      }

      Path()
        .commands(this.progressPathCmd)
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
    }
    .width("100%")
    .height(this.height)
  }
}