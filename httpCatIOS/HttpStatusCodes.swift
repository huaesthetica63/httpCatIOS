//
//  HttpStatusCodes.swift
//  httpCatIOS
//
//  Created by Админ on 28.01.2023.
//

import Foundation
enum HTTPStatusCode: Int, CaseIterable {
    case cont = 100
    case switchingProtocols = 101
    case processing = 102
    case ok = 200
    case created = 201
    case accepted = 202
    case nonAuthoritativeInformation = 203
    case noContent = 204
    case partialContent = 206
    case multiStatus = 207
    case multipleChoices = 300
    case movedPermanently = 301
    case found = 302
    case seeOther = 303
    case notModified = 304
    case useProxy = 305
    case temporaryRedirect = 307
    case permenantRedirect = 308
    case badRequest = 400
    case unauthorized = 401
    case paymentRequired = 402
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case notAcceptable = 406
    case proxyAuthenticationRequired = 407
    case requestTimeout = 408
    case conflict = 409
    case gone = 410
    case lengthRequired = 411
    case preconditionFailed = 412
    case payloadTooLarge = 413
    case URITooLong = 414
    case unsupportedMediaType = 415
    case rangeNotSatisfiable = 416
    case expectationFailed = 417
    case teapot = 418
    case enhanceYourCalm = 420
    case misdirectedRequest = 421
    case unprocessableEntity = 422
    case locked = 423
    case failedDependency = 424
    case tooEarly = 425
    case upgradeRequired = 426
    case tooManyRequests = 429
    case requestHeaderFieldsTooLarge = 431
    case noResponse = 444
    case blockedByWindowsParentalControl = 450
    case unavailableForLegalReasons = 451
    case HTTPRequestSentToHTTPSPort = 497
    case TokenExpired = 498
    case clientClosedRequest = 499
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 503
    case gatewayTimeout = 504
    case variantAlsoNegotiates = 506
    case insufficientStorage = 507
    case loopDetected = 508
    case bandwidthLimitExceed = 509
    case notExtended = 510
    case networkAuthenticationRequired = 511
    case webserverIsDown = 521
    case connectionTimedOut = 522
    case originIsUnreachable = 523
    case sslHandshakeFailed = 525
    case networkConnectTimeoutError = 599
}
