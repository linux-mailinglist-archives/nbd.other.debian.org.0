Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 01522173170
	for <lists+nbd@lfdr.de>; Fri, 28 Feb 2020 07:57:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7808420956; Fri, 28 Feb 2020 06:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 28 06:57:09 2020
Old-Return-Path: <houpu.main@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7D4E22092F
	for <lists-other-nbd@bendel.debian.org>; Fri, 28 Feb 2020 06:41:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1EuztdWtbM37 for <lists-other-nbd@bendel.debian.org>;
	Fri, 28 Feb 2020 06:41:28 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1D7CF20935
	for <nbd@other.debian.org>; Fri, 28 Feb 2020 06:41:28 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id d9so847208plo.11
        for <nbd@other.debian.org>; Thu, 27 Feb 2020 22:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=RF9tXMqH5IFSvwyrzV693N167Q3mcb3XDjDmX8n/l+E=;
        b=KQTDDFpHSHmpDIPiKbs4TzJOJx+6dAWvbnj+Rg1PyDP4scHKyf/xJYaOqyy8SUPKPB
         28HUg3iIE4RQ2vkjATGHaf2tSlKZWTOk6JehugMSvNYvfZvyWvzr2ZW4+lBPHS3gQAdV
         SecH3GKUq0Mbvlzyek6eFFv2x9hTEmTUI4O5nX7yhckqwzrua2Vjw9+GGtDT/eRhxsJP
         7EkwUejQamgZMP7KmRFSP5/mFXRxMSk+fZgO+nmLQFODkC+TWxm0IOcUPrhmomXj9gTQ
         DawBWANcCS+6i2CerR0Ev2zNQ+hfWi4qvlirWw/naeTZu18eymcdetytOMkjomGDydeS
         DKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RF9tXMqH5IFSvwyrzV693N167Q3mcb3XDjDmX8n/l+E=;
        b=Hhx83Y+XEEryn9msSSN8IwsaPZj3nSpA/jCdmiJ6bdZlKouth/QQsQm1TgIx5KaL62
         8jKbOMcy22g6prwz8Lyn6iFdmQ00IpiMF0vta0lWCQXCJ9Q/w8R1K3450klfxjgoI3As
         PitD5vVpShJJ4OIkSPtySxRdlqjClfF0ctsYbKmAy51lON61RiCqyXfzIsOREgGFVXeR
         mbseagxGszPQIGADa/u5oWLUy4bSksPLcUqkvc114dFkd1mzJIBihGGT5w55RTb/sXbi
         ttQZqkvAuKQTJ4uVRx/BZT2sPo+/TbL7laR6oKPZePX+MNzuFOCzSZNcv8WApkEk2duZ
         1Xow==
X-Gm-Message-State: APjAAAXYY/Sc897N2e0EsW4hMcmXqD9Gtg4usI8IP4vnkcLG4t51tJ1d
	WmiGTJ5WKMqyCFrjQNCr26w=
X-Google-Smtp-Source: APXvYqwXBTa1NPLOXOdv9XMJL4+pbLl1KOa6hlBD5UBlROn2h81/lQxvm867u3Bhnix41a0Eythb7w==
X-Received: by 2002:a17:902:bf49:: with SMTP id u9mr2634575pls.199.1582872084386;
        Thu, 27 Feb 2020 22:41:24 -0800 (PST)
Received: from debian.lc ([61.120.150.75])
        by smtp.gmail.com with ESMTPSA id w11sm9420707pfn.4.2020.02.27.22.41.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Feb 2020 22:41:23 -0800 (PST)
From: Hou Pu <houpu.main@gmail.com>
X-Google-Original-From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	mchristi@redhat.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH v2 0/2] nbd: requeue request if only one connection is configured
Date: Fri, 28 Feb 2020 01:40:28 -0500
Message-Id: <20200228064030.16780-1-houpu@bytedance.com>
X-Mailer: git-send-email 2.11.0
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gYOHvtM_iGC.A.pkC.FnLWeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/835
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200228064030.16780-1-houpu@bytedance.com
Resent-Date: Fri, 28 Feb 2020 06:57:09 +0000 (UTC)

Hello,

NBD server could be upgraded if we have multiple connections.
But if we have only one connection, after we take down NBD server,
all inflight IO could finally timeout and return error. These
patches fix this using current reconfiguration framework.

I noticed that Mike has following patchset

nbd: local daemon restart support
https://lore.kernel.org/linux-block/5DD41C49.3080209@redhat.com/

It add another netlink interface (NBD_ATTR_SWAP_SOCKETS) and requeue
request immediately after recongirure/swap socket. It do not need to
wait for timeout to fire and requeue in timeout handler, which seems more
like an improvement. Let fix this in current framework first.

Changes compared to v2:
Fix comments in nbd_read_stat() to be aligned with the code change
suggested by Mike Christie.

Hou Pu (2):
  nbd: enable replace socket if only one connection is configured
  nbd: requeue command if the soecket is changed

 drivers/block/nbd.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

-- 
2.11.0

