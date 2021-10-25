Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B484398DC
	for <lists+nbd@lfdr.de>; Mon, 25 Oct 2021 16:42:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 295DD2047C; Mon, 25 Oct 2021 14:42:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 25 14:42:22 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 336AB2036A
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Oct 2021 14:25:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id u4BHCNANIaWp for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Oct 2021 14:25:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pj1-x1035.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A3B7F20346
	for <nbd@other.debian.org>; Mon, 25 Oct 2021 14:25:22 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id om14so8398488pjb.5
        for <nbd@other.debian.org>; Mon, 25 Oct 2021 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=34PmSfQOG07gU3fQRAV116BDNZ8vyqmNrac0iFZZhZ8=;
        b=b2nkeZ2CMBBGyjkH0v2BBAVzFfgxYePp+8yPTERseQuN9EVDpkRCDFCWs9ew/iWE5c
         5OYfzur0wxvZ4SM6CwGjGhYWsC/R8qUjtqjDfiFG8prYfV2J/P9BePAqR9pqiGQbwc38
         tEbLZD3kDZG9YyxflDERBVni+SGGU0vaWpCyoLcYUaOlH6A3jYkwMgmQu2h2LJMQHnrJ
         WGlXz51dv3K+LQ5sqpEVQqIq+8R8q0LjpN1VxpbsMZS0wNX7GvH5JAgwVJMIpawaBroO
         D8FNG0fTq6snijFMPoHSUn9K+igxH8TJOLK98zqXLQ6NWf0ODICiml2t/aMZHPtVORiU
         s1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=34PmSfQOG07gU3fQRAV116BDNZ8vyqmNrac0iFZZhZ8=;
        b=sv0INsrlZ4fS54WtJFa6inkn7C+rp3JUN4yOI2I9m64yzIx2qrSoMy75oAiONO6Efc
         dVpQIbyGv4E8OUIs/4IGN/Tg9tFBXNnyKpLcgQYf1dIa2m5lsk+6YqXVh8yvi9RfA93x
         zcCTEoohtJpN5Or/Z5ZopR9X9QMaYqeaC9rMjjZizHilfK9lEYfEvBrEaE468vb7MukD
         Yx/et9uONzojwir3oq2kINIzm84w7ie0u3vnkOS/MSE3l0MkJJNC6yeWtk0OAI3nRVx0
         anHDKkun5aUORJx4fDFgRL2Wtf3dLIIif5HDVaDj9XwBgv7TrO4x3rYLcR/4LZNGUBzp
         vPlw==
X-Gm-Message-State: AOAM531Vu8CKyj9SpFSv6y/J0e8vVwRsca4HH0E6jClSM8rNrwhuJwnE
	PZ/s/WOjU3C9ywC51uMMLxr/
X-Google-Smtp-Source: ABdhPJzH5eg/+QPzpvST0pmvC/Rnw+zNH7pzd4mvAczULWSZ3WGI+jHGJwEapLzt5GfZovLa7shShQ==
X-Received: by 2002:a17:902:c40f:b0:140:6774:9365 with SMTP id k15-20020a170902c40f00b0014067749365mr1617852plk.67.1635171918588;
        Mon, 25 Oct 2021 07:25:18 -0700 (PDT)
Received: from localhost ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d15sm22099056pfu.12.2021.10.25.07.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:25:15 -0700 (PDT)
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
Subject: [PATCH v2 0/4] Add blk_validate_block_size() helper for drivers to validate block size
Date: Mon, 25 Oct 2021 22:25:02 +0800
Message-Id: <20211025142506.167-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tyqpTCILicB.A.KIH.OJsdhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1568
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211025142506.167-1-xieyongji@bytedance.com
Resent-Date: Mon, 25 Oct 2021 14:42:22 +0000 (UTC)

The block layer can't support the block size larger than
page size yet, so driver needs to validate the block size
before setting it. Now this validation is done in device drivers
with some duplicated codes. This series tries to add a block
layer helper for it and makes loop driver, nbd driver and
virtio-blk driver use it.

V1 to V2:
- Return and print error if validation fails in virtio-blk driver

Xie Yongji (4):
  block: Add a helper to validate the block size
  nbd: Use blk_validate_block_size() to validate block size
  loop: Use blk_validate_block_size() to validate block size
  virtio-blk: Use blk_validate_block_size() to validate block size

 drivers/block/loop.c       | 17 ++---------------
 drivers/block/nbd.c        |  3 ++-
 drivers/block/virtio_blk.c | 11 +++++++++--
 include/linux/blkdev.h     |  8 ++++++++
 4 files changed, 21 insertions(+), 18 deletions(-)

-- 
2.11.0

