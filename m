Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A99071535E7
	for <lists+nbd@lfdr.de>; Wed,  5 Feb 2020 18:06:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 74D962111E; Wed,  5 Feb 2020 17:06:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb  5 17:06:13 2020
Old-Return-Path: <vsementsov@virtuozzo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=MURPHY_DRUGS_REL8 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E296620926
	for <lists-other-nbd@bendel.debian.org>; Wed,  5 Feb 2020 16:50:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0l2Hlycf-TZv for <lists-other-nbd@bendel.debian.org>;
	Wed,  5 Feb 2020 16:50:39 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -3.5
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8487420C5E
	for <nbd@other.debian.org>; Wed,  5 Feb 2020 16:44:12 +0000 (UTC)
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1izNmR-0000ZH-91; Wed, 05 Feb 2020 19:43:59 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: nbd@other.debian.org
Cc: qemu-block@nongnu.org,
	eblake@redhat.com,
	w@uter.be,
	nsoffer@redhat.com,
	den@openvz.org,
	vsementsov@virtuozzo.com
Subject: [PATCH 0/2] Structured requests and 64bit commands
Date: Wed,  5 Feb 2020 19:43:50 +0300
Message-Id: <20200205164352.16673-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nAGe2GCwQ5E.A.5RC.FYvOeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/793
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200205164352.16673-1-vsementsov@virtuozzo.com
Resent-Date: Wed,  5 Feb 2020 17:06:13 +0000 (UTC)

Hi all. This is a continuation of thread
"NBD extended (or structured?) request"

Here is a very drafty draft of the feature, to discuss the general
design.

Vladimir Sementsov-Ogievskiy (2):
  nbd/proto: introduce structured request
  nbd/proto: add NBD_CMD_WRITE_ZEROES64

 doc/proto.md | 130 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 98 insertions(+), 32 deletions(-)

-- 
2.21.0

