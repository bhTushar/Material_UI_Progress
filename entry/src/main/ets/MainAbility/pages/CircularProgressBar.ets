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

import router from '@system.router'
import { MaterialProgressBar, MaterialProgressStyle } from "@ohos/materialprogressbar"

@Entry
@Component
struct MaterialProgressBarSample {
  @State progress: number = 30
  @State indeterminate: boolean = false
  frameworkModel: MaterialProgressBar.MaterialModel = new MaterialProgressBar.MaterialModel().setStyle(MaterialProgressStyle.MaterialHorizontal)
    .setProgress(30)
    .setSecondProgress(60)
    .setColor(0x009688)
    .setSecondColor(0x9fc6c2)
    .setBgColor(0xd7d7d7)

  aboutToAppear() {
    setTimeout(() => {
      this.indeterminate = true
    }, 1000)
  }

  build() {
    Scroll() {
      Flex({ direction: FlexDirection.Column, }) {

        Text("Indeterminate Circular ProgressBar")
          .fontSize('18vp')
          .margin('2vp')
        Flex() {
          MaterialProgressBar({ mStyle: MaterialProgressStyle.MaterialCircular,
            modelBuild: {
              indeterminateAngle: true,
              indeterminate: true,
              radius: 48,
              strokeWidth: '4vp'
            } })
        }.margin({ top: '20vp', left: '40vp' })

        Text("Indeterminate Circular ProgressBar (Customized color)")
          .fontSize('18vp')
          .margin('2vp')
        Flex() {
          MaterialProgressBar({ mStyle: MaterialProgressStyle.MaterialCircular,
            modelBuild: {
              indeterminateAngle: true,
              indeterminate: true,
              color: "#ff99a07f",
              bgColor: '#ffd6d30b',
              radius: 48,
              strokeWidth: '4vp'
            } })
        }.margin({ top: '20vp', left: '40vp' })

        Text("Indeterminate Circular ProgressBar (Variable Stroke)")
          .fontSize('18vp')
          .margin('2vp')
        Flex() {
          MaterialProgressBar({ mStyle: MaterialProgressStyle.MaterialCircular,
            modelBuild: {
              indeterminateAngle: true,
              indeterminate: true,
              radius: 60,
              strokeWidth: '10vp'
            } })
        }.margin({ top: '20vp', left: '40vp' })

        Text("Determinate Circular ProgressBar (Snapshot)")
          .fontSize('18vp')
          .margin('2vp')
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
          Flex() {
            MaterialProgressBar({ mStyle: MaterialProgressStyle.MaterialCircular,
              modelBuild: {
                indeterminateAngle: false,
                indeterminate: false,
                radius: 48,
                strokeWidth: '4vp'
              } })
          }
          .position({ x: '55vp', y: '45vp' })
          .padding({ right: '5vp', bottom: '0vp' })
        }.height('100vp')

        Text("Determinate Circular ProgressBar (One round progress)")
          .fontSize('18vp')
          .margin('2vp')
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
          Flex() {
            MaterialProgressBar({ mStyle: MaterialProgressStyle.MaterialCircular,
              modelBuild: {
                indeterminateAngle: false,
                indeterminate: true,
                radius: 48,
                strokeWidth: '4vp'
              } })
          }
          .position({ x: '55vp', y: '45vp' })
          .padding({ right: '5vp', bottom: '0vp' })
        }.height('100vp')

        Text("Determinate Circular ProgressBar (Variable stroke)")
          .fontSize('18vp')
          .margin('2vp')
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
          Flex() {
            MaterialProgressBar({ mStyle: MaterialProgressStyle.MaterialCircular,
              modelBuild: {
                indeterminateAngle: false,
                indeterminate: true,
                radius: 48,
                strokeWidth: '1vp'
              } })
          }
          .position({ x: '55vp', y: '45vp' })
          .padding({ right: '5vp', bottom: '0vp' })
        }.height('100vp')

      }
      .width('100%')
      .padding({ top: '0vp', left: '10vp', right: '10vp', bottom: '5vp' })
      .margin({ top: '0vp', left: '0vp', right: '0vp', bottom: '5vp' })

    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.On)
    .width('100%')
    .height('100%')
    .padding({ top: '20vp', left: '0vp', right: '10vp', bottom: '50vp' })
  }
}