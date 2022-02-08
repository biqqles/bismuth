// SPDX-FileCopyrightText: 2021 Mikhail Zolotukhin <mail@genda.life>
//
// SPDX-License-Identifier: MIT

import { Controller, ControllerImpl } from "./controller";
import { TSProxy } from "./extern/proxy";
import { LogImpl } from "./util/log";

/**
 * Script entry-point from QML side.
 * @param qmlObjects objects from QML gui. Required for the interaction with QML, as we cannot access globals.
 * @param kwinApi KWin scripting API. Required for interaction with KWin, as we cannot access globals.
 */
export function init(
  qmlObjects: Bismuth.Qml.Main,
  kwinScriptingApi: KWin.Api,
  proxy: TSProxy
): Controller {
  const config = proxy.jsConfig();
  const logger = new LogImpl(config);

  logger.log(`Configuration object, ignore screen: ${config.ignoreScreen}`);
  logger.log(`Configuration object, floatingClass: ${config.floatingClass}`);

  const controller = new ControllerImpl(
    qmlObjects,
    kwinScriptingApi,
    config,
    logger,
    proxy
  );

  controller.start();

  return controller;
}