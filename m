Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FWafBislOmqQ2gcAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Tue, 23 Jun 2026 08:18:19 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5526B46CC
	for <lists+nbd@lfdr.de>; Tue, 23 Jun 2026 08:18:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=temperror ("DNS error when getting key") header.d=smail.nju.edu.cn header.s=iohv2404 header.b=wWG+F6re;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=temperror reason="SPF/DKIM temp error" header.from=smail.nju.edu.cn (policy=temperror)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5EBFE207D1; Tue, 23 Jun 2026 06:18:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 23 06:18:13 2026
Old-Return-Path: <peiyang_he@smail.nju.edu.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FORGED_MUA_MOZILLA,FOURLA,MD5_SHA1_SUM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3F74B207CD
	for <lists-other-nbd@bendel.debian.org>; Tue, 23 Jun 2026 06:02:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.689 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, FORGED_MUA_MOZILLA=2.309, FOURLA=0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 358W8YnLeGNJ for <lists-other-nbd@bendel.debian.org>;
	Tue, 23 Jun 2026 06:02:17 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 409 seconds by postgrey-1.36 at bendel; Tue, 23 Jun 2026 06:02:16 UTC
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 98A26207CC
	for <nbd@other.debian.org>; Tue, 23 Jun 2026 06:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1782194516;
	bh=3Jb4hbovMhXjoPYlBFxuuBMSsi9viUd+26z34ZL5FCU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject;
	b=wWG+F6re1pQeJVSKXoK37rl/dlg/Yqo1znQfffA23kvVc1yvGY/qEjTIkyUnnxnNU
	 m3KKQLrK5dfe/cGzsddA5MOGt6AhPlbHoAPYMc01umOdM7yd9/WraFyrKNtuAkfL57
	 SkwgKd8bMKbf9SlUqhLrPoLQl3wRWp2PmnDGt4ps=
X-QQ-mid: esmtpgz14t1782193936t595f704e
X-QQ-Originating-IP: 0bFXOGvfhcAf2Y9nMW7jvmbowcCu3T3bou4PCndmFyc=
Received: from [127.0.0.1] ( [36.152.24.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Jun 2026 13:51:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 478658043353222059
Message-ID: <B518B1A813407AC5+004c9da2-4504-44ce-ac1b-7b46bf0c30db@smail.nju.edu.cn>
Date: Tue, 23 Jun 2026 13:51:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: josef@toxicpanda.com, linux-block@vger.kernel.org
From: Peiyang He <peiyang_he@smail.nju.edu.cn>
Subject: [BUG] nbd: backend string memory leaked when device_create_file()
 fails in nbd_genl_connect()
Cc: axboe@kernel.dk, nbd@other.debian.org, linux-kernel@vger.kernel.org,
 syzkaller@googlegroups.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:smail.nju.edu.cn:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NMB3uNxca02msVIqnqoXc3LESPUWoZ1wJdf+e4NEyyEGIwuDq1trHcmL
	b2WfJNBRNPtLB/ncFEpvVaxC4G1VWOZGL245kdWamx0/L/xNySGnC2JuwV6I79LztF5Nia8
	HPs9b2R/NCLCTkQwUJjGXieqUhGEvF+kts1CScfwFW56GLSggCXnuO+4iiMv28t5eqmWpey
	xIw+3MtKRLogkFz3ybCQQeKltbJS5HCnXyRQR9y5UaWK+Kk3DZ7HJ3PPdkozvyP/O3ewENa
	/W9YsnD4KZSaTegGiAWwdiyjAc5AikWHnZv46JSK4Z/V6xqsDP71iiuRfX9XuHMc0qzAQmJ
	5aDGYtIT0RwGzwc8Yz4kkcirChlhOKbSj+gf1jaXTiEsBbIN4NYqnQpQfgDHehQeY7dIfDs
	aN5YbVxzrygzhcniW8St/GrAofPyHlCyNNnSm9LqX7+euGuFR4L9wpW0PwAQqsuqwTWggbo
	LbmtUWzDjVcsPDUP+CMRamJrJRHTDRWyigi1nwrj2DaOJ1IMUqijvzmpAg2/WKfMt4Rai4j
	OqXdhKv1JoG1r5Bm5d1ZLClt8EkDOVTnO4ksRQocJe65eacjIfzwg81qXzWqyRejRm8tvKf
	vBdWDYqb0d8TZ1kst88jtXThCcnIq8gFq2Ptk/yU79HMif4J1YKPoLBq/zIY8JW8mg2s7hY
	KRdZyHImcadLk+atZj7yE739M4gbqp2fV9nsGJY9xJaJHFxTIrc0ruw8ucWgMQEqx/iUyyy
	Q1JhzuHhHWAt7WYArOCsu+LGCDoTmRCivUX7kRL4ax81jHLLCDiC1iuTqg3sQqRyvztKYrG
	As6tmNa2i0doKFniLc7FLptR+Kxd1gfUiuLdd/9FLzgsXs835hN0rzvBYSWPWbmR7fpwh+N
	i7Wj0hQ/O2xP43MtZyhyr+wsoS1/944vS7xlZPGuQmdhMzSYa5KE1Ka/cuuIYghbwIHWqV8
	iuqGVSAciqEnTt5cAldSST0LEqE0avMmN7M8RF81EmmIOjenM2TVjnpRQEkNvj8N5tQx2XL
	D40FgOFFBnco+exTJOUbFLgC4pmQs=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TVbmrZr7FOK.A.8AMD.lUiOqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3560
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/B518B1A813407AC5+004c9da2-4504-44ce-ac1b-7b46bf0c30db@smail.nju.edu.cn
Resent-Date: Tue, 23 Jun 2026 06:18:13 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.31 / 15.00];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:linux-block@vger.kernel.org,m:axboe@kernel.dk,m:nbd@other.debian.org,m:linux-kernel@vger.kernel.org,m:syzkaller@googlegroups.com,s:lists@lfdr.de];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_SENDER(0.00)[peiyang_he@smail.nju.edu.cn,bounce-nbd=lists@other.debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	DKIM_TRACE(0.00)[smail.nju.edu.cn:?];
	R_DKIM_TEMPFAIL(0.00)[smail.nju.edu.cn:s=iohv2404];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[peiyang_he@smail.nju.edu.cn,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	TO_DN_NONE(0.00)[];
	DMARC_DNSFAIL(0.00)[smail.nju.edu.cn : SPF/DKIM temp error,reject];
	TAGGED_RCPT(0.00)[nbd];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:rdns,bendel.debian.org:helo,smail.nju.edu.cn:mid,smail.nju.edu.cn:from_mime,other.debian.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB5526B46CC

Hello Linux kernel developers and maintainers,

I found a memory leak in drivers/block/nbd.c when fuzzing with Syzkaller.

Kernel version: commit 8cd9520d35a6c38db6567e97dd93b1f11f185dc6 (tag v7.1).
And the leak is also possible in the current mainline.

Relevant kernel config:

  CONFIG_BLK_DEV_NBD=y
  CONFIG_DEBUG_KMEMLEAK=y
  CONFIG_FAULT_INJECTION=y
  CONFIG_FAILSLAB=y
  CONFIG_FAULT_INJECTION_DEBUG_FS=y

=============================
The original Syzkaller report
=============================

BUG: memory leak
unreferenced object 0xffff888011d17420 (size 16):
  comm "syz.3.80", pid 9959, jiffies 4294977483
  hex dump (first 16 bytes):
    2f 64 65 76 2f 6e 62 64 23 00 00 00 00 00 00 00  /dev/nbd#.......
  backtrace (crc 889be63d):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4575 [inline]
    slab_alloc_node mm/slub.c:4899 [inline]
    __do_kmalloc_node mm/slub.c:5295 [inline]
    __kmalloc_noprof+0x552/0x850 mm/slub.c:5308
    kmalloc_noprof include/linux/slab.h:954 [inline]
    nla_strdup+0xc6/0x150 lib/nlattr.c:816
    nbd_genl_connect+0x1231/0x1c10 drivers/block/nbd.c:2224
    genl_family_rcv_msg_doit+0x209/0x2f0 net/netlink/genetlink.c:1114
    genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
    genl_rcv_msg+0x55c/0x800 net/netlink/genetlink.c:1209
    netlink_rcv_skb+0x158/0x420 net/netlink/af_netlink.c:2555
    genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
    netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
    netlink_unicast+0x584/0x850 net/netlink/af_netlink.c:1344
    netlink_sendmsg+0x8ba/0xd60 net/netlink/af_netlink.c:1899
    sock_sendmsg_nosec net/socket.c:787 [inline]
    __sock_sendmsg net/socket.c:802 [inline]
    ____sys_sendmsg+0x9eb/0xb80 net/socket.c:2699
    ___sys_sendmsg+0x134/0x1d0 net/socket.c:2753
    __sys_sendmsg+0x16d/0x220 net/socket.c:2785
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0x116/0x800 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f


<<<<<<<<<<<<<<< tail report >>>>>>>>>>>>>>>


==========
Root cause
==========

nbd_genl_connect() allocates the backend string unconditionally BEFORE
creating the sysfs file:

    /* drivers/block/nbd.c (v7.1, around line 2223) */
    if (info->attrs[NBD_ATTR_BACKEND_IDENTIFIER]) {
        nbd->backend = nla_strdup(...);       /* (1) heap alloc */
        if (!nbd->backend) {
            ret = -ENOMEM;
            goto out;                         /* (2) backend is NULL here, no leak */
        }
    }

    ret = device_create_file(disk_to_dev(nbd->disk), &backend_attr);
    if (ret) {
        dev_err(...);
        goto out;                             /* (3) LEAK: flag not yet set */
    }

    set_bit(NBD_RT_HAS_BACKEND_FILE, &config->runtime_flags); /* (4) skipped */

    ret = nbd_start_device(nbd);
out:
    ...
    mutex_unlock(&nbd->config_lock);
    nbd_config_put(nbd);
    ...

The cleanup path in nbd_config_put() frees nbd->backend ONLY when
NBD_RT_HAS_BACKEND_FILE is set:

    /* drivers/block/nbd.c (v7.1, around line 1445) */
    if (test_and_clear_bit(NBD_RT_HAS_BACKEND_FILE,
                           &config->runtime_flags)) {
        device_remove_file(disk_to_dev(nbd->disk), &backend_attr);
        kfree(nbd->backend);      /* never reached here if flag is not set */
        nbd->backend = NULL;
    }

When device_create_file() at step (3) fails (e.g. due to OOM or fault injection),
execution jumps to out before step (4) sets the flag.
nbd_config_put() is then called with config_refs dropping to zero,
but since NBD_RT_HAS_BACKEND_FILE is not set, it skips the kfree().
The string allocated at step (1) is therefore leaked.

The size of a single leak equals the length of the NBD_ATTR_BACKEND_IDENTIFIER
netlink string rounded up to the next slab boundary.
The nla_policy entry for this attribute has no .len constraint, so in theory a single connect call
could leak up to ~65507 bytes (NLA_STRING maximum).
During Syzkaller fuzzing, the fuzzer produced a 16-byte string.


============
Proposed Fix
============

Decouple device_remove_file() (which correctly requires the flag to avoid
removing a file that was never created) from kfree(nbd->backend) (which only
needs the pointer to be non-NULL):

--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1445,9 +1445,9 @@ static void nbd_config_put(struct nbd_device *nbd)
 		if (test_and_clear_bit(NBD_RT_HAS_BACKEND_FILE,
 				       &config->runtime_flags)) {
 			device_remove_file(disk_to_dev(nbd->disk), &backend_attr);
-			kfree(nbd->backend);
-			nbd->backend = NULL;
 		}
+		kfree(nbd->backend);
+		nbd->backend = NULL;


The flag still guards device_remove_file() so we never try to remove a sysfs
file that was never created.  nbd->backend is always freed if non-NULL,
regardless of whether the file creation succeeded.

Note: the line number in the above diff is valid in the v7.1 kernel.
I will adjust it according to the mainline kernel if this patch is considered resonable.


Best,
Peiyang

