Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB2E43B4FB
	for <lists+nbd@lfdr.de>; Tue, 26 Oct 2021 17:00:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 45F69201B8; Tue, 26 Oct 2021 15:00:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 26 15:00:10 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6EE0D2043E
	for <lists-other-nbd@bendel.debian.org>; Tue, 26 Oct 2021 14:42:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QdWcgN_mNeOG for <lists-other-nbd@bendel.debian.org>;
	Tue, 26 Oct 2021 14:42:45 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pg1-x52e.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 407CB20433
	for <nbd@other.debian.org>; Tue, 26 Oct 2021 14:42:44 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id f5so14325187pgc.12
        for <nbd@other.debian.org>; Tue, 26 Oct 2021 07:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kq1S4qwrXxntJdVPakPNFVUHYz9PO0MQF46/bxmhu6A=;
        b=GCOtfNgJc/gWbiXMYXaOiq+mPhYtINAr3+fG/7IaxrGobGnpF99gBf5wTJXTQE38LQ
         XeTMtthd0FpEylDdPknYwFg9jQ4mtKJKcJGDpjW0WV3ZNwZDToiwa+pVD50cuL4t8pfn
         VPaeq2Eh6/WmfyZ5wvVsre1sz0bu2qH356BXr2Kt2xqTgCsvcXUHr4geo/AqPdVFxVMe
         aBGAdnLBDkuABroOnbT+mjL9BDkImCLTS8+X3IppSLxsxGq9YkJTSrDCSBp5QFA7HTIo
         YTcTspQ8VXNgpe9OKF6FeUp37lGoVuBfOTrRnCcwV9xOj1LHsqxosz+7cKahQ4R8AvWu
         PUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kq1S4qwrXxntJdVPakPNFVUHYz9PO0MQF46/bxmhu6A=;
        b=7eRtc3cmQ8hrVSOPoci30bB2H8FvcUjdf8pt1OFWeEqWJcwpu9pJ+q4CZIFBblndOR
         79x3TuKotlMdJ3wfHW4W96cdSrB1IzRLfaS3paX7ecy28nDclzVG9MpiGUNLGLsCFkIc
         KsfVO9hkdoIZ1x8VTZdVN3T2QZjNeoeXDf8cmCiMUEYxoqjht8nGP+Vvqcn2BkOA1sUe
         8ahFu+TI2IWRTKYqgIQ8p35D2PTpL90TJf2w4E4kTX9oEsRyazeVbmpqrgCHLDcs04FJ
         so3VXYmog8W6FSeWUDgprAkqz3fQL/1/mMYeVEEsCVpwn6PAfObNGiiekEB45cBf0iWS
         o8aA==
X-Gm-Message-State: AOAM530d1RBwy/ZLyx9TabvGYLrtPEDXYuYIrvB9hY5hmMBT9wEhYwDu
	yFuYspw79SF4MHuJ7HquiplE
X-Google-Smtp-Source: ABdhPJzkY4v2ovqKTCsH10wzAvT6oWtc2VWoqCE+/V11MgxPYQTpmw0eijnhkSRjbEpBTYhsmbADag==
X-Received: by 2002:a63:9508:: with SMTP id p8mr18874681pgd.413.1635259361434;
        Tue, 26 Oct 2021 07:42:41 -0700 (PDT)
Received: from localhost ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id p9sm22413642pfn.7.2021.10.26.07.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 07:42:35 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: axboe@kernel.dk,
	hch@lst.de,
	josef@toxicpanda.com,
	mst@redhat.com,
	jasowang@redhat.com,
	stefanha@redhat.com,
	kwolf@redhat.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH v3 0/4] Add blk_validate_block_size() helper for drivers to validate block size
Date: Tue, 26 Oct 2021 22:40:11 +0800
Message-Id: <20211026144015.188-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Ea-pw8FNgtN.A.ubF.6fBehB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1577
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211026144015.188-1-xieyongji@bytedance.com
Resent-Date: Tue, 26 Oct 2021 15:00:10 +0000 (UTC)

The block layer can't support the block size larger than
page size yet, so driver needs to validate the block size
before setting it. Now this validation is done in device drivers
with some duplicated codes. This series tries to add a block
layer helper for it and makes loop driver, nbd driver and
virtio-blk driver use it.

We tested both invalid block size and valid block size cases
for loop driver with the example in man page [1] and for
nbd and virtio-blk driver with qemu-nbd and storage-daemon (vduse)
in the qemu repo [2].

[1] https://man7.org/linux/man-pages/man4/loop.4.html
[2] https://github.com/bytedance/qemu/tree/vduse

V2 to V3:
- Fix some commit logs and print message

V1 to V2:
- Return and print error if validation fails in virtio-blk driver

Xie Yongji (4):
  block: Add a helper to validate the block size
  nbd: Use blk_validate_block_size() to validate block size
  loop: Use blk_validate_block_size() to validate block size
  virtio-blk: Use blk_validate_block_size() to validate block size

 drivers/block/loop.c       | 17 ++---------------
 drivers/block/nbd.c        |  3 ++-
 drivers/block/virtio_blk.c | 12 ++++++++++--
 include/linux/blkdev.h     |  8 ++++++++
 4 files changed, 22 insertions(+), 18 deletions(-)

-- 
2.11.0

