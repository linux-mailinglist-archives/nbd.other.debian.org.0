Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DA4751F22
	for <lists+nbd@lfdr.de>; Thu, 13 Jul 2023 12:42:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5166F20AC6; Thu, 13 Jul 2023 10:42:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 13 10:42:12 2023
Old-Return-Path: <marek.brzyski@alsdel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C58A620B82
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jul 2023 10:24:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, T_SCC_BODY_TEXT_LINE=-0.01,
	UNWANTED_LANGUAGE_BODY=0.03] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fNmmzGP_Ss5W for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jul 2023 10:24:02 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 IN_IX_MANITU=4.35 CL_IP_EQ_FROM_MX=-3.1; rate: -0.25
X-Greylist: delayed 400 seconds by postgrey-1.36 at bendel; Thu, 13 Jul 2023 10:24:02 UTC
Received: from mail.alsdel.com (mail.alsdel.com [135.125.191.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4F1C320B7F
	for <nbd@other.debian.org>; Thu, 13 Jul 2023 10:24:01 +0000 (UTC)
Received: by mail.alsdel.com (Postfix, from userid 1002)
	id 7D01147B48; Thu, 13 Jul 2023 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsdel.com; s=mail;
	t=1689243440; bh=CAYDwZmm9N5ZiJT6ScYnRcZJNRz0YmzbvUPtJS3sV08=;
	h=Date:From:To:Subject:From;
	b=V1LUvoT7o5tYWCWypuJf47B01ok6tLrej6RdghkA93cWAFhVs6sO1jrb7t1QC7oBS
	 6uvjkbEfqSBpG7YQisEl9bTVJR1jbJ3n78Bb1KHv+K5/yWkfR7fVh2zQ1MjyDU9QxK
	 1Z+4OJgHxAD++QSwuxiPQw3iTfefTtkUcI15mR4ji2EwpCqHm+/FjNS70dx28fVY3P
	 GNF8UpkmqiN0XCMq0ErmWY1sl6LnZM6suhR0FB5rNf/8+NDJ6ejGWqf0zQ34e9e5Ka
	 ZsnQWgZR1oTbaSIMaK5gJAWHPgjO7R+0vfjyeGPG+AL/gZc0eZABbWDKYc3fBHFZ6Q
	 IXqDDW/j9cXcQ==
Received: by alsdel.com for <nbd@other.debian.org>; Thu, 13 Jul 2023 10:15:57 GMT
Message-ID: <20230713091432-0.1.16.4jfw.0.nar7ekt4kk@alsdel.com>
Date: Thu, 13 Jul 2023 10:15:57 GMT
From: "Marek Brzyski" <marek.brzyski@alsdel.com>
To: <nbd@other.debian.org>
Subject: =?UTF-8?Q?Magazyny_do_wynaj=C4=99cia_w_Twoim_regionie?=
X-Mailer: mail.alsdel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZwXsNqWC-EH.A.gSF.EU9rkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2568
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230713091432-0.1.16.4jfw.0.nar7ekt4kk@alsdel.com
Resent-Date: Thu, 13 Jul 2023 10:42:12 +0000 (UTC)

Dzie=C5=84 dobry,

mamy dla Pa=C5=84stwa do zaoferowania wynajem powierzchni magazynowo-prod=
ukcyjnej z dost=C4=99pnymi modu=C5=82ami od 3 500 mkw na konkurencyjnych =
warunkach.

Oddajemy najemcom do u=C5=BCytku park magazynowo-produkcyjny z wyj=C4=85t=
kowo atrakcyjn=C4=85 lokalizacj=C4=85 (zar=C3=B3wno dla pracownik=C3=B3w,=
 jak i Klient=C3=B3w) - przy g=C5=82=C3=B3wnych szlakach komunikacyjnych,=
 z dogodnym dojazdem do dr=C3=B3g krajowych, odpowiedniej infrastruktury =
oraz komunikacji miejskiej.

Dzi=C4=99ki wykorzystaniu nowoczesnych standard=C3=B3w technicznych i pro=
 ekologicznych mog=C4=85 Pa=C5=84stwo wygenerowa=C4=87 oszcz=C4=99dno=C5=9B=
ci w zu=C5=BCyciu energii si=C4=99gaj=C4=85ce nawet kilkudziesi=C4=99ciu =
procent.

Chc=C4=85 Pa=C5=84stwo pozna=C4=87 dost=C4=99pne opcje?


Pozdrawiam serdecznie
Marek Brzyski
Sales Manager

