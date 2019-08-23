Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D719B233
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 16:37:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 67030204FA; Fri, 23 Aug 2019 14:37:44 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 14:37:44 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CA332204F0
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 14:37:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gU6TwHOjTBVf for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 14:37:32 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8780E20449
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 14:37:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BBA918C8910;
	Fri, 23 Aug 2019 14:37:29 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4F6E6CE58;
	Fri, 23 Aug 2019 14:37:26 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	libguestfs@redhat.com
Subject: [PATCH 0/5] Add NBD fast zero support to qemu client and server
Date: Fri, 23 Aug 2019 09:37:21 -0500
Message-Id: <20190823143726.27062-1-eblake@redhat.com>
In-Reply-To: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Fri, 23 Aug 2019 14:37:29 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <CKvJMotAtXF.A.oTC.4o_XdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/633
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190823143726.27062-1-eblake@redhat.com
Resent-Date: Fri, 23 Aug 2019 14:37:44 +0000 (UTC)

See the cross-post cover letter for more details:
https://www.redhat.com/archives/libguestfs/2019-August/msg00322.html

Based-on: https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg04805.html
[Andrey Shinkevich block: workaround for unaligned byte range in fallocate()]

Eric Blake (5):
  nbd: Improve per-export flag handling in server
  nbd: Prepare for NBD_CMD_FLAG_FAST_ZERO
  nbd: Implement client use of NBD FAST_ZERO
  nbd: Implement server use of NBD FAST_ZERO
  nbd: Tolerate more errors to structured reply request

 docs/interop/nbd.txt |  3 +-
 include/block/nbd.h  |  6 +++-
 block/nbd.c          |  7 +++++
 blockdev-nbd.c       |  3 +-
 nbd/client.c         | 39 ++++++++++++++----------
 nbd/common.c         |  5 ++++
 nbd/server.c         | 70 ++++++++++++++++++++++++++------------------
 qemu-nbd.c           |  7 +++--
 8 files changed, 88 insertions(+), 52 deletions(-)

-- 
2.21.0

