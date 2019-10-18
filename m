Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 00279DD49D
	for <lists+nbd@lfdr.de>; Sat, 19 Oct 2019 00:27:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CEED7204F3; Fri, 18 Oct 2019 22:27:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct 18 22:27:08 2019
Old-Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,
	MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3170920612
	for <lists-other-nbd@bendel.debian.org>; Fri, 18 Oct 2019 22:09:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oxxppx2yOf2I for <lists-other-nbd@bendel.debian.org>;
	Fri, 18 Oct 2019 22:09:20 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 144FD20608
	for <nbd@other.debian.org>; Fri, 18 Oct 2019 22:09:20 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0BEE72246A;
	Fri, 18 Oct 2019 22:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571436556;
	bh=dcVigU6fDMmZoextzHaCniTrTK6eBi3KgAmY8viInsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=z5TSf3fEqy8DarWcxh48UXXVG1XUS5/ElpNR7Xh7idaj9R7si1WGh9hHD1ndkK0Ck
	 TJhHeMOi6Xn/oxp7QJlb8wt3tKj98969aYlo33RxEdstMKCRwy6AjMZpm4Oo75no9b
	 z/L1nKHCrGd7T5VJ+a7cSjCtd1NCoABQ+4XgqUvE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xiubo Li <xiubli@redhat.com>,
	Mike Christie <mchristi@redhat.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	Sasha Levin <sashal@kernel.org>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH AUTOSEL 4.14 53/56] nbd: fix possible sysfs duplicate warning
Date: Fri, 18 Oct 2019 18:07:50 -0400
Message-Id: <20191018220753.10002-53-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018220753.10002-1-sashal@kernel.org>
References: <20191018220753.10002-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <g2YNz-i5QqK.A.rLB.8wjqdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/716
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191018220753.10002-53-sashal@kernel.org
Resent-Date: Fri, 18 Oct 2019 22:27:08 +0000 (UTC)

From: Xiubo Li <xiubli@redhat.com>

[ Upstream commit 862488105b84ca744b3d8ff131e0fcfe10644be1 ]

1. nbd_put takes the mutex and drops nbd->ref to 0. It then does
idr_remove and drops the mutex.

2. nbd_genl_connect takes the mutex. idr_find/idr_for_each fails
to find an existing device, so it does nbd_dev_add.

3. just before the nbd_put could call nbd_dev_remove or not finished
totally, but if nbd_dev_add try to add_disk, we can hit:

debugfs: Directory 'nbd1' with parent 'block' already present!

This patch will make sure all the disk add/remove stuff are done
by holding the nbd_index_mutex lock.

Reported-by: Mike Christie <mchristi@redhat.com>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Xiubo Li <xiubli@redhat.com>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index a234600849558..3e45004407963 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -228,8 +228,8 @@ static void nbd_put(struct nbd_device *nbd)
 	if (refcount_dec_and_mutex_lock(&nbd->refs,
 					&nbd_index_mutex)) {
 		idr_remove(&nbd_index_idr, nbd->index);
-		mutex_unlock(&nbd_index_mutex);
 		nbd_dev_remove(nbd);
+		mutex_unlock(&nbd_index_mutex);
 	}
 }
 
-- 
2.20.1

