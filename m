Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E16B6AE5C6
	for <lists+nbd@lfdr.de>; Tue,  7 Mar 2023 17:03:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 70214204B7; Tue,  7 Mar 2023 16:03:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar  7 16:03:13 2023
Old-Return-Path: <syoshida@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MD5_SHA1_SUM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D4C7C204D7
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Mar 2023 15:47:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hzntBwMA-UUK for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Mar 2023 15:47:51 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id D52B9204C5
	for <nbd@other.debian.org>; Tue,  7 Mar 2023 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678204065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=99qSzzKU2KdFXld+Lq6WBJNO5mX1Yf91cqdsuF+XSsA=;
	b=FZ8jLYmB81xPacI8OSJaqe2W+4e5DCb703njW7Wx+zqeUZw/awBb1g8Gv91nfvVgM6im/t
	coIG62dRX6YrHx/00IKAYnUCiEnppsuGRQZZlJp4gtDjlkRpJ9CB5+MMqp2RxN3qRNeDEY
	xkEL4XZKbR9+Z+dD4UjoMc/fhPxrrcA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-qj9wdfidPyuljW8lIexRkw-1; Tue, 07 Mar 2023 10:16:38 -0500
X-MC-Unique: qj9wdfidPyuljW8lIexRkw-1
Received: by mail-pl1-f197.google.com with SMTP id k3-20020a170902ce0300b0019ca6e66303so7828756plg.18
        for <nbd@other.debian.org>; Tue, 07 Mar 2023 07:16:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678202185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99qSzzKU2KdFXld+Lq6WBJNO5mX1Yf91cqdsuF+XSsA=;
        b=oTWtigZEzf6AuR2UNEeW8OQXsII1I9qS0jch5p1ft95WRD4obtlGRfd9q1nibOabfb
         u6l5WGCLwYG0C2ZDXM5jn6X6Xs54aHiWGFzPq8lj0yK2Xy3KrFF0rvTI01canxOqSpCJ
         HAvYl4U/q9dIVs0LReindwtmlMeh6urq7evVOG5oWPeoo5W+l97C4ZCIXaz/KFXPilIN
         AdCSpvA4YjGN2vFQiqapP915vOj/YdIR+jH0vPQtjj590wkurgyRVnVRYN3SJ2PebJky
         Of5sK5Eav1TMCzsMgNoPM2xqQCzx0IU5z15m++B82uav5+3Q8RmV3ablVxFYzFNFM9LG
         PK3Q==
X-Gm-Message-State: AO0yUKUhE/H+A4l1x0isFOtuY/UJAb4Ac48Ve87bvFA69PlcAC0UP/Vn
	qMs3MV4LFYgtUzUsJXtElspV5S6vc/v9LbY6ymhszZmp3h+M8NlRqDOihTlPvYP5fz2QVGtUzPY
	ju9RXCouEOVINUQ==
X-Received: by 2002:a05:6a20:8ba2:b0:bc:f0d2:e268 with SMTP id m34-20020a056a208ba200b000bcf0d2e268mr13657296pzh.29.1678202185559;
        Tue, 07 Mar 2023 07:16:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8rScMeHoPkW1lRtZRzrsVYRuLkfQLlDEt+6ifGK29z6JHlPj7m4fmPdiB9OP5KE3rYS0a4ww==
X-Received: by 2002:a05:6a20:8ba2:b0:bc:f0d2:e268 with SMTP id m34-20020a056a208ba200b000bcf0d2e268mr13657266pzh.29.1678202185180;
        Tue, 07 Mar 2023 07:16:25 -0800 (PST)
Received: from localhost.localdomain ([240d:1a:c0d:9f00:ca6:1aff:fead:cef4])
        by smtp.gmail.com with ESMTPSA id k9-20020a6568c9000000b005038291e5cbsm904648pgt.35.2023.03.07.07.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 07:16:24 -0800 (PST)
From: Shigeru Yoshida <syoshida@redhat.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: yukuai3@huawei.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	Shigeru Yoshida <syoshida@redhat.com>,
	syzbot+6229476844294775319e@syzkaller.appspotmail.com
Subject: [PATCH] nbd: Fix hang when connection reset by peer
Date: Wed,  8 Mar 2023 00:15:28 +0900
Message-Id: <20230307151528.2532986-1-syoshida@redhat.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <R7vF2QJiWfI.A.j0C.BB2BkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2356
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230307151528.2532986-1-syoshida@redhat.com
Resent-Date: Tue,  7 Mar 2023 16:03:13 +0000 (UTC)

syzbot reported hang task [1].  The following program is a simplified
version of the reproducer:

static int fd;

static void *do_ioctl(void *arg)
{
	ioctl(fd, (int)arg);
	return NULL;
}

int main(void)
{
	int sv[2];
	pthread_t th[2];

	if ((fd = open("/dev/nbd0", 0)) < 0)
		return 1;
	if (socketpair(AF_UNIX, SOCK_STREAM, 0, sv) < 0)
		return 1;
	if (ioctl(fd, NBD_SET_SIZE_BLOCKS, 0x1) < 0)
		return 1;
	if (ioctl(fd, NBD_SET_SOCK, sv[0]) < 0)
		return 1;
	if (pthread_create(&th[0], NULL, do_ioctl, (void *)NBD_DO_IT) < 0)
		return 1;
	sleep(1);
	if (pthread_create(&th[1], NULL, do_ioctl, (void *)BLKRRPART) < 0)
		return 1;
	sleep(1);
	close(sv[1]);
	sleep(1);
	return 0;
}

When the connection reset by peer, nbd_read_reply() in recv_work()
returns -EOCNNRESET and wakes up the task blocking in
nbd_start_device_ioctl().  wait_event_interruptible() returns 0 in
this case, so inflight IOs in the queue are not cleared.  This causes
hang task.

This patch introduces new runtime flag NBD_RT_CONNECTION_RESET to
notify connection reset by peer.  nbd_start_device_ioctl() checks this
and clears inflight IOs accordingly.

Fixes: 3fe1db626a56 ("nbd: partition nbd_read_stat() into nbd_read_reply() and nbd_handle_reply()")
Cc: Yu Kuai <yukuai3@huawei.com>
Link: https://syzkaller.appspot.com/bug?id=f55039d9ac10967440ca01ff24c38ccfa597efe1 [1]
Reported-by: syzbot+6229476844294775319e@syzkaller.appspotmail.com
Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
---
 drivers/block/nbd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 592cfa8b765a..fe861a2b063b 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -83,6 +83,7 @@ struct link_dead_args {
 #define NBD_RT_BOUND			5
 #define NBD_RT_DISCONNECT_ON_CLOSE	6
 #define NBD_RT_HAS_BACKEND_FILE		7
+#define NBD_RT_CONNECTION_RESET		8
 
 #define NBD_DESTROY_ON_DISCONNECT	0
 #define NBD_DISCONNECT_REQUESTED	1
@@ -833,9 +834,13 @@ static void recv_work(struct work_struct *work)
 
 	while (1) {
 		struct nbd_reply reply;
+		int err = nbd_read_reply(nbd, args->index, &reply);
 
-		if (nbd_read_reply(nbd, args->index, &reply))
+		if (err) {
+			if (err == -ECONNRESET)
+				set_bit(NBD_RT_CONNECTION_RESET, &config->runtime_flags);
 			break;
+		}
 
 		/*
 		 * Grab .q_usage_counter so request pool won't go away, then no
@@ -1412,7 +1417,7 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd)
 	mutex_unlock(&nbd->config_lock);
 	ret = wait_event_interruptible(config->recv_wq,
 					 atomic_read(&config->recv_threads) == 0);
-	if (ret) {
+	if (ret || test_bit(NBD_RT_CONNECTION_RESET, &config->runtime_flags)) {
 		sock_shutdown(nbd);
 		nbd_clear_que(nbd);
 	}
-- 
2.39.0

