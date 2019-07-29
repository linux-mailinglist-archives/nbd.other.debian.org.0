Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id ED436791B0
	for <lists+nbd@lfdr.de>; Mon, 29 Jul 2019 19:00:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 96A97203B8; Mon, 29 Jul 2019 17:00:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul 29 17:00:08 2019
Old-Return-Path: <navid.emamdoost@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,
	FREEMAIL_FROM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F314F202DB
	for <lists-other-nbd@bendel.debian.org>; Mon, 29 Jul 2019 16:42:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.079 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nr4qmTvUx358 for <lists-other-nbd@bendel.debian.org>;
	Mon, 29 Jul 2019 16:42:48 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3284C202C8
	for <nbd@other.debian.org>; Mon, 29 Jul 2019 16:42:48 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id q22so1675602iog.4
        for <nbd@other.debian.org>; Mon, 29 Jul 2019 09:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bmQBBxHIt/eza4I+J3H3QVjWn12oGbnozJKzf9V+0Ig=;
        b=eg7LsPyDXHvp4+juupUsF6DEW1xyfkm0S7KlgYBgIvTviXu5aaPxd2Ra64WBP1Hp19
         LRvBFDEvdorvIFrVkf67rS7O0YL2ARodjMsu7RpaaV0i9mP+vvBMrLBvQv23AGwBFyy7
         0LnuDifYQh8F/A3jUi6O5BiItpq3U8TZcdaovZA8U9UHoJXB1ZO0O6VpSwU/dfm5rVzH
         7LNznnMqtliI6e+NCruUP/fiLNPqEipr39KpcpUV9L3yvf6fnvNbv5nmgbvnN4+2ofol
         2xFPlOwsTjkytoJB3siD+JoT+bN9B66Wt94mOlbdxjAprgYUHvTeiG3HAFhXCCAs8/EJ
         vmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bmQBBxHIt/eza4I+J3H3QVjWn12oGbnozJKzf9V+0Ig=;
        b=Kv4cgC6dA8GLme3OGgTvH1JezRyCUIZZ333VMpWsQYW4a6dmu/5G/g9qxH6F9VxR42
         l+jOgl9OiNUhE/qnU+UIQQao4/Q8ao42Swy10sxfWm43orb+Zmc/exzQ9AhKw5R5USOc
         Parrvfst4yOtvMe46V72FhHUsiunfxUf3CFuCV/kIhunvQRXe7Qisc2ua2dZ2lPrmiLK
         d9mNR9TO242B2czCOkzfC6fhu6MUkmdS9oTskWrONk+HTP1+tgYbDhqNkw6ykiIOPwU1
         7QSn742tSMO4HylYyB9I8ybuaD+5HXbw2OxXuVrE9shfgET78YPeu2kuQGzwSEvRWR+E
         jB5A==
X-Gm-Message-State: APjAAAX960HqRoH/whSWYpzioayuG/6xyj3tloQoSV8kDTCBE2B+2YgS
	O1/OUpunD9JHqjCYhcGClB4=
X-Google-Smtp-Source: APXvYqx9RAnoQcF1WuI32NPf46CQ9XRe79lNZjazF9WSw9v2zVi05F9kaIX9YjTFK/o1qyuwb1eP3g==
X-Received: by 2002:a6b:f114:: with SMTP id e20mr102069896iog.169.1564418565034;
        Mon, 29 Jul 2019 09:42:45 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id z17sm83662696iol.73.2019.07.29.09.42.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 09:42:44 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: josef@toxicpanda.com
Cc: kjlu@umn.edu,
	smccaman@umn.edu,
	secalert@redhat.com,
	emamd001@umn.edu,
	Navid Emamdoost <navid.emamdoost@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] nbd_genl_status: null check for nla_nest_start
Date: Mon, 29 Jul 2019 11:42:26 -0500
Message-Id: <20190729164226.22632-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190729130912.7imtg3hfnvb4lt2y@MacBook-Pro-91.local>
References: <20190729130912.7imtg3hfnvb4lt2y@MacBook-Pro-91.local>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <iozbJxlV1qI.A.ujF.YYyPdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/605
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190729164226.22632-1-navid.emamdoost@gmail.com
Resent-Date: Mon, 29 Jul 2019 17:00:08 +0000 (UTC)

nla_nest_start may fail and return NULL. The check is inserted, and
errno is selected based on other call sites within the same source code.
Update: removed extra new line.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/block/nbd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 9bcde2325893..2410812d1e82 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2149,6 +2149,11 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	dev_list = nla_nest_start_noflag(reply, NBD_ATTR_DEVICE_LIST);
+	if (!dev_list) {
+		ret = -EMSGSIZE;
+		goto out;
+	}
+
 	if (index == -1) {
 		ret = idr_for_each(&nbd_index_idr, &status_cb, reply);
 		if (ret) {
-- 
2.17.1

