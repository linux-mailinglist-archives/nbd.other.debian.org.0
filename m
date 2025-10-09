Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A8484BC9851
	for <lists+nbd@lfdr.de>; Thu, 09 Oct 2025 16:33:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5DC18205BD; Thu,  9 Oct 2025 14:33:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct  9 14:33:18 2025
Old-Return-Path: <omosnace@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,WORD_WITHOUT_VOWELS autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3CF2020588
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Oct 2025 14:16:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.563 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.467, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eIBB2wP85xy9 for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Oct 2025 14:16:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 3389D20581
	for <nbd@other.debian.org>; Thu,  9 Oct 2025 14:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760019397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LuKvTV/ZvxsZcI+HNaWfxeETY2vb8WWG5aZ1soizNHk=;
	b=T4w6m9H7ROpjEok8ilb8mupfgTDmaeQ12DSqtRqf7SmIXGGAsinudWQ0hZGAD/rMErKCQF
	e+Bec20yGkPaM9MEHipm6uV+zBbJ7N7C4E3/BYmLI9AIWJprAiSffpeZ77A20JI9xn7f/Q
	gOQIg0dAuUKzxFM3cNKY/5t2Ejvvkvc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-1CMSPv0bNU2YQpMi7jliJg-1; Thu, 09 Oct 2025 09:45:45 -0400
X-MC-Unique: 1CMSPv0bNU2YQpMi7jliJg-1
X-Mimecast-MFC-AGG-ID: 1CMSPv0bNU2YQpMi7jliJg_1760017544
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46e2d845ebeso5360185e9.1
        for <nbd@other.debian.org>; Thu, 09 Oct 2025 06:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760017544; x=1760622344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LuKvTV/ZvxsZcI+HNaWfxeETY2vb8WWG5aZ1soizNHk=;
        b=rh6IxtKMP1CTSH/H1bLfCB5akGlHGDw7W1sewBghUQ/xbLOE+BaAQdTrwakxr9g2Vd
         UvvHJJW8zoIaAo5m4+Ae9aOWyPjAdRQdVtbtvXhGgdw/0AFYcaC6N2aDD4QkSkz2Th93
         +2+5g5jGIIqm25W6yyY/ZvZ/W4mjPpjWXCJ5CAYTwzExy0c7iAHOd1b+T4EVFyoOyTKA
         AbHzgrWcU6LoPe0X5gk83iWbVRxBcCiJ6j4LmexjpwnzSXNkHqaf8TfERgFFeJ6m5laq
         sXTNm+2MyzJ/+vjPy3/u4ITwpldXHAvyHSO20utLZi9Y3Ixf3QqcwZh+Ccbk/jTNk7Mv
         d/Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWnV8cRGjf2yyuT7ZgNuieBn9BkLFL2AtCH9iXBgnFEL4b9E63uuILcasxUa/Wb+Qivkzk=@other.debian.org
X-Gm-Message-State: AOJu0Yy29+0a0Kd76CWHLNEZVaBctqNjO/BY8kbnFx39gBQX6MBO+pLz
	76vLHiTo9Vts9NGua6q5rIfIqE27L4vEpzbOk9bR6FbvKDJRoeFZBu0dO/S11RSY2S/iK0LWAsR
	zgTemiJkaAWuhR8VeBvWWxfkqNv0Y9tIyJGP9ZVJx69lkM7Y0AKHKC2s=
X-Gm-Gg: ASbGnctD6yDqFcFjwKfsL7ArWEFqa/FIapDcSA6livrfhB/ZlbGotsgOe2NexjT99Hq
	F/4wTNKtoVznQfXsas9v3V8dyBwO/N0Hl+mveOfkeZpQSWul6ToOL1u+p6uFbL9aHdeFb93/d/9
	+SB1IWB2vG60tAoF9VwHDC0hpx06dPgxcC6sXtDa006VkFIwT6AepN3PjI6G7sCQ5ZuJkOXZMMI
	QlXGTdot+YPvJgOKjDj8CiDvdzWc141FSC8syU8XI6CWaPHl6g8iJM3a4rTgbayax+NbwNPu5KA
	vV2yFx3yQgQsEipMnD38aDZE4XZziACVjMcW
X-Received: by 2002:a05:600c:8288:b0:46e:448a:1235 with SMTP id 5b1f17b1804b1-46fa9aadeedmr76517325e9.16.1760017544447;
        Thu, 09 Oct 2025 06:45:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfgpeOYz8rB6dmj0SJ47sQixPMa8U/4+cKkDJEI0Y54hBFNm63lOaoILSZN0gkfmu+whVYIg==
X-Received: by 2002:a05:600c:8288:b0:46e:448a:1235 with SMTP id 5b1f17b1804b1-46fa9aadeedmr76517105e9.16.1760017544025;
        Thu, 09 Oct 2025 06:45:44 -0700 (PDT)
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46faf16ac01sm50840625e9.11.2025.10.09.06.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:45:43 -0700 (PDT)
From: Ondrej Mosnacek <omosnace@redhat.com>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>
Subject: [PATCH] nbd: override creds to kernel when calling sock_{send,recv}msg()
Date: Thu,  9 Oct 2025 15:45:42 +0200
Message-ID: <20251009134542.1529148-1-omosnace@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cN9B3cjoLg39cxqg2umNrAOTYYlAGCOtlvcU4MeLSso_1760017544
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WP5gJO8kMmO.A.x2bP.ue85oB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3448
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20251009134542.1529148-1-omosnace@redhat.com
Resent-Date: Thu,  9 Oct 2025 14:33:18 +0000 (UTC)

sock_{send,recv}msg() internally calls security_socket_{send,recv}msg(),
which does security checks (e.g. SELinux) for socket access against the
current task. However, _sock_xmit() in drivers/block/nbd.c may be called
indirectly from a userspace syscall, where the NBD socket access would
be incorrectly checked against the calling userspace task (which simply
tries to read/write a file that happens to reside on an NBD device).

To fix this, temporarily override creds to kernel ones before calling
the sock_*() functions. This allows the security modules to recognize
this as internal access by the kernel, which will normally be allowed.

A way to trigger the issue is to do the following (on a system with
SELinux set to enforcing):

    ### Create nbd device:
    truncate -s 256M /tmp/testfile
    nbd-server localhost:10809 /tmp/testfile

    ### Connect to the nbd server:
    nbd-client localhost

    ### Create mdraid array
    mdadm --create -l 1 -n 2 /dev/md/testarray /dev/nbd0 missing

    ### Stop the array
    mdadm --stop /dev/md/testarray

    ### Disconnect the nbd device
    nbd-client -d /dev/nbd0

    ### Reconnect to nbd devices:
    nbd-client localhost

After these steps, assuming the SELinux policy doesn't allow the
unexpected access pattern, errors will be visible on the kernel console:

[   93.997980] nbd2: detected capacity change from 0 to 524288
[  100.314271] md/raid1:md126: active with 1 out of 2 mirrors
[  100.314301] md126: detected capacity change from 0 to 522240
[  100.317288] block nbd2: Send control failed (result -13)           <-----
[  100.317306] block nbd2: Request send failed, requeueing            <-----
[  100.318765] block nbd2: Receive control failed (result -32)        <-----
[  100.318783] block nbd2: Dead connection, failed to find a fallback
[  100.318794] block nbd2: shutting down sockets
[  100.318802] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[  100.318817] Buffer I/O error on dev md126, logical block 0, async page read
[  100.322000] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[  100.322016] Buffer I/O error on dev md126, logical block 0, async page read
[  100.323244] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[  100.323253] Buffer I/O error on dev md126, logical block 0, async page read
[  100.324436] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[  100.324444] Buffer I/O error on dev md126, logical block 0, async page read
[  100.325621] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[  100.325630] Buffer I/O error on dev md126, logical block 0, async page read
[  100.326813] I/O error, dev nbd2, sector 2048 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[  100.326822] Buffer I/O error on dev md126, logical block 0, async page read
[  100.326834]  md126: unable to read partition table
[  100.329872] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[  100.329889] Buffer I/O error on dev nbd2, logical block 0, async page read
[  100.331186] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[  100.331195] Buffer I/O error on dev nbd2, logical block 0, async page read
[  100.332371] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[  100.332379] Buffer I/O error on dev nbd2, logical block 0, async page read
[  100.333550] I/O error, dev nbd2, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[  100.333559] Buffer I/O error on dev nbd2, logical block 0, async page read
[  100.334721]  nbd2: unable to read partition table
[  100.350993]  nbd2: unable to read partition table

The corresponding SELinux denial on Fedora/RHEL will look like this
(assuming it's not silenced):
type=AVC msg=audit(1758104872.510:116): avc:  denied  { write } for  pid=1908 comm="mdadm" laddr=::1 lport=32772 faddr=::1 fport=10809 scontext=system_u:system_r:mdadm_t:s0-s0:c0.c1023 tcontext=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 tclass=tcp_socket permissive=0

Cc: Ming Lei <ming.lei@redhat.com>
Link: https://bugzilla.redhat.com/show_bug.cgi?id=2348878
Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 drivers/block/nbd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 6463d0e8d0cef..d50055c974a6b 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -52,6 +52,7 @@
 static DEFINE_IDR(nbd_index_idr);
 static DEFINE_MUTEX(nbd_index_mutex);
 static struct workqueue_struct *nbd_del_wq;
+static struct cred *nbd_cred;
 static int nbd_total_devices = 0;
 
 struct nbd_sock {
@@ -554,6 +555,7 @@ static int __sock_xmit(struct nbd_device *nbd, struct socket *sock, int send,
 	int result;
 	struct msghdr msg = {} ;
 	unsigned int noreclaim_flag;
+	const struct cred *old_cred;
 
 	if (unlikely(!sock)) {
 		dev_err_ratelimited(disk_to_dev(nbd->disk),
@@ -562,6 +564,8 @@ static int __sock_xmit(struct nbd_device *nbd, struct socket *sock, int send,
 		return -EINVAL;
 	}
 
+	old_cred = override_creds(nbd_cred);
+
 	msg.msg_iter = *iter;
 
 	noreclaim_flag = memalloc_noreclaim_save();
@@ -586,6 +590,8 @@ static int __sock_xmit(struct nbd_device *nbd, struct socket *sock, int send,
 
 	memalloc_noreclaim_restore(noreclaim_flag);
 
+	revert_creds(old_cred);
+
 	return result;
 }
 
@@ -2669,7 +2675,15 @@ static int __init nbd_init(void)
 		return -ENOMEM;
 	}
 
+	nbd_cred = prepare_kernel_cred(&init_task);
+	if (!nbd_cred) {
+		destroy_workqueue(nbd_del_wq);
+		unregister_blkdev(NBD_MAJOR, "nbd");
+		return -ENOMEM;
+	}
+
 	if (genl_register_family(&nbd_genl_family)) {
+		put_cred(nbd_cred);
 		destroy_workqueue(nbd_del_wq);
 		unregister_blkdev(NBD_MAJOR, "nbd");
 		return -EINVAL;
@@ -2706,6 +2720,8 @@ static void __exit nbd_cleanup(void)
 
 	nbd_dbg_close();
 
+	put_cred(nbd_cred);
+
 	mutex_lock(&nbd_index_mutex);
 	idr_for_each(&nbd_index_idr, &nbd_exit_cb, &del_list);
 	mutex_unlock(&nbd_index_mutex);
-- 
2.51.0

