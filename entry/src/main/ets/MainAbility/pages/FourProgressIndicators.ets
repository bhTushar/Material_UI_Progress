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

        Text("Determinate Linear Progress")
          .fontSize('18vp')
          .margin('2vp')
        Flex({ direction: FlexDirection.Column }) {
          MaterialProgressBar({ mStyle: MaterialProgressStyle.MaterialHorizontal,
            modelBuild: {
              color: '#009688',
              secondColor: '#9fc6c2',
              secondProgress: 60,
              bgColor: "#b3ddd9"
            } })
        }.width('100%')
        .height('70vp')
        .margin('2vp')

        Text("Indeterminate Linear Progress")
          .fontSize('18vp')
          .margin('2vp')
        Flex({ direction: FlexDirection.Column }) {
          MaterialProgressBar({ mStyle: MaterialProgressStyle.MaterialHorizontal,
            modelBuild: {
              indeterminateAngle: true,
              color: '#009688',
              bgColor: "#b3ddd9"
            } })
        }.width('100%')
        .height('70vp')
        .margin('2vp')

        Text("Determinate Circular ProgressBar")
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

        Text("Indeterminate Circular ProgressBar")
          .fontSize('18vp')
          .margin('2vp')
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
          Flex() {
            MaterialProgressBar({ mStyle: MaterialProgressStyle.MaterialCircular,
              modelBuild: {
                indeterminateAngle: true,
                indeterminate: true,
                radius: 48,
                strokeWidth: '4vp'
              } })
          }
          .position({ x: '50vp', y: '50vp' }).padding({ right: '15vp', bottom: '0vp' })
        }.height(100)
      }
      .width('100%')
      .padding({ top: '0vp', left: '10vp', right: '10vp', bottom: '50vp' })
      .margin({ top: '0vp', left: '0vp', right: '0vp', bottom: '50vp' })
    }.scrollable(ScrollDirection.Vertical)
    .width('100%')
    .height('80%')
    .padding({ top: '100vp', left: '10vp', right: '10vp', bottom: '50vp' })
  }
}