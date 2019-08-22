Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D719A98CC9
	for <lists+nbd@lfdr.de>; Thu, 22 Aug 2019 09:59:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B64B8203DD; Thu, 22 Aug 2019 07:59:51 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 22 07:59:51 2019
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B7B88203D5
	for <lists-other-nbd@bendel.debian.org>; Thu, 22 Aug 2019 07:59:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CrZXff_AEv3P for <lists-other-nbd@bendel.debian.org>;
	Thu, 22 Aug 2019 07:59:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CD9EF203A0
	for <nbd@other.debian.org>; Thu, 22 Aug 2019 07:59:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CBC9C028329;
	Thu, 22 Aug 2019 07:59:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.70.39.226])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 174575D6A7;
	Thu, 22 Aug 2019 07:59:34 +0000 (UTC)
From: xiubli@redhat.com
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: mchristi@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	Xiubo Li <xiubli@redhat.com>
Subject: [PATCH 0/2 v3] nbd: fix possible page fault for nbd disk
Date: Thu, 22 Aug 2019 13:29:21 +0530
Message-Id: <20190822075923.11996-1-xiubli@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 22 Aug 2019 07:59:37 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zfMfkneGDHD.A.sVC.3tkXdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/627
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190822075923.11996-1-xiubli@redhat.com
Resent-Date: Thu, 22 Aug 2019 07:59:51 +0000 (UTC)

From: Xiubo Li <xiubli@redhat.com>

V3:
- fix the case that when the NBD_CFLAG_DESTROY_ON_DISCONNECT bit is not
  set.
- add "nbd: rename the runtime flags as NBD_RT_ prefixed"


Xiubo Li (2):
  nbd: rename the runtime flags as NBD_RT_ prefixed
  nbd: fix possible page fault for nbd disk

 drivers/block/nbd.c | 108 +++++++++++++++++++++++++++++---------------
 1 file changed, 71 insertions(+), 37 deletions(-)

-- 
2.21.0

