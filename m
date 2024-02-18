Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5628594A6
	for <lists+nbd@lfdr.de>; Sun, 18 Feb 2024 05:42:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9BEF220664; Sun, 18 Feb 2024 04:42:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Feb 18 04:42:12 2024
Old-Return-Path: <keescook@chromium.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,GMAIL,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A7EF22065B
	for <lists-other-nbd@bendel.debian.org>; Sun, 18 Feb 2024 04:25:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.561 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.451, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	GMAIL=1, RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id I9Ib8ID-4az7 for <lists-other-nbd@bendel.debian.org>;
	Sun, 18 Feb 2024 04:25:49 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .chromium. - helo: .mail-pg1-x534.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B022920659
	for <nbd@other.debian.org>; Sun, 18 Feb 2024 04:25:46 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5dca1efad59so3020149a12.2
        for <nbd@other.debian.org>; Sat, 17 Feb 2024 20:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708230342; x=1708835142; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPPOVToP9KvYFFYAhd+euhiEp/R/1IO3VQIxg89zLZk=;
        b=dRJOfN7aIBx8iXc/0Z4HMDwUHWZxY7oNRnHAjpE1pT9ZQPz5azWOfBN8slWKODmJ1t
         mr1sUY+KIbKh+qbeoPS3ReqycQXXcCKDsdkjS1+usTpk/VRw6ZWvFOy70RPLRPvrFROm
         ZOOub763Sd175qt4oXYFVEnjx+5rL3Jx+Y8fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708230342; x=1708835142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPPOVToP9KvYFFYAhd+euhiEp/R/1IO3VQIxg89zLZk=;
        b=opMw1SCoZbiV9B3a5VE7HlZjr7fkdZIBhc+eXAQTkngATtIZxXR80mMD5A4MGreYCq
         jaaTe5IOMOUeycT2yIFYp24EEInr1nut7kQ0p0HLwTbifti1Bio792nP7CTmYHqXX38r
         HdqZy4EhKrYmYz7ZPkyvYqLTV/vaihUwksvUNNlbbbHkoLcGOvEZg3WDl6k3VE/yCQ54
         6UpQGWt8ouLmbRsNtS3n9SfRQp/9AvM117JR7631iNXSolpZu4bHa6OCG9xC1J79AuPX
         70drNMJN76uS1NZVrDEQrO6lC5NK5qc1DCvEpXjH/SOhv6IpDeKeRHwdF3UnQT94M6D2
         UDaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZZTIttON/IjXN7as46FgIRJFidG5cUojkFXgc13SkcmG0XAzvyi6SeU9W/ll7HCCdwuqDSA4H1AO0ZIk0PR/i86wSSA==
X-Gm-Message-State: AOJu0YwBrZyhJZt6kFe/eyNUU4FjREWJg/T+xBIPR/E42EjjmxHAVd4A
	4qcUV9MKu/lR4a6/Io98dl2cZDtCvrk/HS06ohY/oKSPNttr8IZqq8fr6NWfZg==
X-Google-Smtp-Source: AGHT+IFjk09QrySxOgBtDCo76+mGw+pZNd0U5JFGwf/tqqImzzxQdPNFpc9iNKIfio5NAiR63Hw3VQ==
X-Received: by 2002:a17:902:b20b:b0:1db:4b23:f97b with SMTP id t11-20020a170902b20b00b001db4b23f97bmr7487589plr.59.1708230342654;
        Sat, 17 Feb 2024 20:25:42 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jc15-20020a17090325cf00b001db54324488sm2142726plb.38.2024.02.17.20.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 20:25:41 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Kees Cook <keescook@chromium.org>,
	Navid Emamdoost <navid.emamdoost@gmail.com>,
	Michal Kubecek <mkubecek@suse.cz>,
	Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v4] nbd: null check for nla_nest_start
Date: Sat, 17 Feb 2024 20:25:38 -0800
Message-Id: <20240218042534.it.206-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=keescook@chromium.org;
 h=from:subject:message-id; bh=0R8zCu0X/ARVuSqlyl7fu4di67hYDgO+9WqGqz+HaEc=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBl0YbBPe25EqmI5l5nzuL7+soJkeVhsbtCpCkDH
 ubGmi/BvUiJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZdGGwQAKCRCJcvTf3G3A
 Jm4SD/4k25Oc6EkBmLy4hVwdpNNdRv+uyAuAXQKD7aOBOpyDpt8qh8Wjxpe+PkBlP8wDVT7g+hi
 SDxOzbm7NvrlnYL6aF9fyDUz1W2tmTVvVnTJuDOIxdMRT4Z9Eer9IhO+LEXmuY8WevRZrbFgnKl
 /n+ZC3HYgck0RexH2TJBbMulSVwwh/rgxqbY4NPz19YLMRs1W4k+artJg6buZ9B+VEFT1WYoNU3
 r33Kr5nru90Yd1QyCEAV28QqD37LynEdBgkUj58fmnzWx5hYluvUR+cSDvtt+ov7Ie5/bcBOoXG
 lArRTlM6G3GMBDcPWXs8AZ3jJPc3YnyK/N9yvyL0VKqfJQcErqJy2RhCS0PbLZkKjQW1ofg3cm8
 3QKhCRRkRDKTCx6FOL7fNT+P5ealU0YBNhatm4gAUl/+9Bn7vTXqWt3NQ8XyPm8TYgf0R3assGN
 NRnf4P/0HkcKTOIx9w7FC7BA2jMXJJAxXxVUPlFNuznghWXsPQQccfjqxjibsjY7bJBa05ljLo8
 7rLaFHTHiVQe8oVL5RR8joZAmlHLGgQjUxLAVm+VoJrP4QMKUOW6wCAGzHWJnFEPupswbmlV/eZ
 rwitO9926hht8LZtRlvZNm2vco0tFIvBmFgkJ0nO2ZuhY3cWZ9sOA1zf70bgn5re+XXe2oYEpFe
 Qx6xzOa L6H7WvAw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <q_RlwZV3LiJ.A.ZrF.kqY0lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2750
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240218042534.it.206-kees@kernel.org
Resent-Date: Sun, 18 Feb 2024 04:42:12 +0000 (UTC)

From: Navid Emamdoost <navid.emamdoost@gmail.com>

nla_nest_start() may fail and return NULL. Insert a check and set errno
based on other call sites within the same source code.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
Reviewed-by: Michal Kubecek <mkubecek@suse.cz>
Fixes: 47d902b90a32 ("nbd: add a status netlink command")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
v3- https://lore.kernel.org/lkml/20190911164013.27364-1-navid.emamdoost@gmail.com/
Resending on behalf of the author. This seems to have gotten lost and
has been getting tracked as CVE-2019-16089 ever since. For example:
https://ubuntu.com/security/CVE-2019-16089
---
 drivers/block/nbd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 33a8f37bb6a1..b7c332528ed7 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2433,6 +2433,12 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	dev_list = nla_nest_start_noflag(reply, NBD_ATTR_DEVICE_LIST);
+	if (!dev_list) {
+		nlmsg_free(reply);
+		ret = -EMSGSIZE;
+		goto out;
+	}
+
 	if (index == -1) {
 		ret = idr_for_each(&nbd_index_idr, &status_cb, reply);
 		if (ret) {
-- 
2.34.1

