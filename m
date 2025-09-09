Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EB8B4FD73
	for <lists+nbd@lfdr.de>; Tue,  9 Sep 2025 15:39:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E27D9205D9; Tue,  9 Sep 2025 13:39:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  9 13:39:13 2025
Old-Return-Path: <3KyrAaAgKA8wwvC4sHwBy66y3w.u645tv6Bzw9.vwt0s5.69y@flex--edumazet.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=4.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MD5_SHA1_SUM,
	RCVD_IN_DNSWL_NONE,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DD4F72058C
	for <lists-other-nbd@bendel.debian.org>; Tue,  9 Sep 2025 13:23:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.601 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001, USER_IN_DEF_DKIM_WL=-7.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Lh8M5EmOZqqx for <lists-other-nbd@bendel.debian.org>;
	Tue,  9 Sep 2025 13:23:00 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-qt1-x849.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2663320585
	for <nbd@other.debian.org>; Tue,  9 Sep 2025 13:22:56 +0000 (UTC)
Received: by mail-qt1-x849.google.com with SMTP id d75a77b69052e-4b6090aeaacso66362331cf.3
        for <nbd@other.debian.org>; Tue, 09 Sep 2025 06:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757424172; x=1758028972; darn=other.debian.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uchVPC5V5AnCU++0LQSE31dfyzhx8FL2wjNsKVYAXlI=;
        b=WLWaitBDXMyP+2D27sIGfSUkbfJ9MSFQnjFdPBmw2xuywzdvWUNAU+fGMqlUIOuMNY
         48xjUM7WCCku3uZ+R8YhU+9vKK7yqMDgqhi4yjOR39glntZM2iFZL6ZaVqy1YoM5UJs5
         wO8PvxW8gjloKvo6gvCH8sSfv8ZfLH33KzsySrS3K5z6Y1aaOm+JbzIebQZW5vEQWqIJ
         KOS4C3/dXNCIyAwvtUHAq0ePb3PYr/1RP0fWpfjDO+C8DzbM0JPWYXo6gzjhP2HZy/zR
         kHbit50HkqQv1vxVeNjj89ObnmmfTrYwaaJ2RiraAA1fUH6OpCA182NaVpU+tE6YkNkF
         L+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757424172; x=1758028972;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uchVPC5V5AnCU++0LQSE31dfyzhx8FL2wjNsKVYAXlI=;
        b=fzalqqiCFfwvbju5quP+gIxlnUAa/GVPkLaweshq0Txz4D+EHHy8ZTPXy8K7x0rVyn
         PGkm1WQybD1u+qDTnXsO+pIFG5lWGE5Nkp38SlP5Oada+4MQJ++X0DLEs8WmXbXxyF30
         Tixy8FpeIocIINp1Q1lpovGoWiQ5D2HTVltZYdavX/l/68Gi2NT0tnj13NubOZemWCBz
         NgLUXJ6xv57dRLqmQJ2LT7R5R7vuQC+SCLPLyS/NiDIv5vz1N/GyOs3Y6oGplgOSvyk3
         dBzO2kS90x19LoLVBDWh5cA5h00tC12PjF9N/NsBBW3YS9jX5yeJDhg50V6xKNwhkzSV
         iXmA==
X-Forwarded-Encrypted: i=1; AJvYcCWbeeeUqsjN7AKSABtwbmjnI4ApxdFdVgEybOj0YyV8qOM28xoETWiKFPNeCrLoqs55XL0=@other.debian.org
X-Gm-Message-State: AOJu0Yy7zQT+RA8XTWiiV8Xu5n5gRuA71sUgwS+N2i2xV+8dmdeDqbjo
	t8eqnyPO0VH9tzzITEO4JBXZhfkPcRdRsUfwe9J7TSUu05q/IgsiZLbyI25nYO6EzoxVGzDAsnK
	xorI3QUFyuig62Q==
X-Google-Smtp-Source: AGHT+IGYpVQiEzn9QHE1zn1hAW5xwDjdaQLoTNKxPgWkv7gyao/+uTsXb3LQmW5bD0GeIq3wlXcgPuI+F3/c5w==
X-Received: from qtz5.prod.google.com ([2002:ac8:5945:0:b0:4b0:a157:1d5b])
 (user=edumazet job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:4b14:b0:4b0:da5c:de57 with SMTP id d75a77b69052e-4b5f844d1fbmr103893091cf.54.1757424171653;
 Tue, 09 Sep 2025 06:22:51 -0700 (PDT)
Date: Tue,  9 Sep 2025 13:22:43 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909132243.1327024-1-edumazet@google.com>
Subject: [PATCH] nbd: restrict sockets to TCP and UDP
From: Eric Dumazet <edumazet@google.com>
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, 
	Eric Dumazet <eric.dumazet@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	syzbot+e1cd6bd8493060bd701d@syzkaller.appspotmail.com, 
	Mike Christie <mchristi@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>, 
	Yu Kuai <yukuai1@huaweicloud.com>, linux-block@vger.kernel.org, nbd@other.debian.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SLYFyJy1aZL.A.aHpC.B4CwoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3431
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250909132243.1327024-1-edumazet@google.com
Resent-Date: Tue,  9 Sep 2025 13:39:13 +0000 (UTC)

Recently, syzbot started to abuse NBD with all kinds of sockets.

Commit cf1b2326b734 ("nbd: verify socket is supported during setup")
made sure the socket supported a shutdown() method.

Explicitely accept TCP and UNIX stream sockets.

Fixes: cf1b2326b734 ("nbd: verify socket is supported during setup")
Reported-by: syzbot+e1cd6bd8493060bd701d@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/netdev/CANn89iJ+76eE3A_8S_zTpSyW5hvPRn6V57458hCZGY5hbH_bFA@mail.gmail.com/T/#m081036e8747cd7e2626c1da5d78c8b9d1e55b154
Signed-off-by: Eric Dumazet <edumazet@google.com>
Cc: Mike Christie <mchristi@redhat.com>
Cc: Richard W.M. Jones <rjones@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Yu Kuai <yukuai1@huaweicloud.com>
Cc: linux-block@vger.kernel.org
Cc: nbd@other.debian.org
---
 drivers/block/nbd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 6463d0e8d0cef71e73e67fecd16de4dec1c75da7..87b0b78249da3325023949585f4daf40486c9692 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1217,6 +1217,14 @@ static struct socket *nbd_get_socket(struct nbd_device *nbd, unsigned long fd,
 	if (!sock)
 		return NULL;
 
+	if (!sk_is_tcp(sock->sk) &&
+	    !sk_is_stream_unix(sock->sk)) {
+		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: should be TCP or UNIX.\n");
+		*err = -EINVAL;
+		sockfd_put(sock);
+		return NULL;
+	}
+
 	if (sock->ops->shutdown == sock_no_shutdown) {
 		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: shutdown callout must be supported.\n");
 		*err = -EINVAL;
-- 
2.51.0.384.g4c02a37b29-goog

