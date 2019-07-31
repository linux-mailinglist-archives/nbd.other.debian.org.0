Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6487C594
	for <lists+nbd@lfdr.de>; Wed, 31 Jul 2019 17:09:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CA277202F1; Wed, 31 Jul 2019 15:09:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul 31 15:09:08 2019
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VERIFIED,FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	TO_TOO_MANY autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6AF25202D3
	for <lists-other-nbd@bendel.debian.org>; Wed, 31 Jul 2019 14:52:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.12 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2hz2VpLFwk6q for <lists-other-nbd@bendel.debian.org>;
	Wed, 31 Jul 2019 14:52:17 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd43.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A2BE220280
	for <nbd@other.debian.org>; Wed, 31 Jul 2019 14:52:14 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id h6so11678136iom.7
        for <nbd@other.debian.org>; Wed, 31 Jul 2019 07:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=EIQbB2zgXphNhV7qrszr5PCCFMAd5NNV0AVDvZDtQIY=;
        b=w5PNd0Oyg/E4hXSbxfvWzwDASd18H5hGr1WPuqn6x9JkzxAwMO5M4PwFnsWEV8u0Mn
         Z+7bXvfVF4WF6st+1vDCd0fdxuP05KjVqvU4UsZ1f8DeVvMT5WloCrS+6FJ45yBs+V2N
         jdFs5+xkoKU13Rv+zCSRJk79Kexzqkilh3GUoyqDfblCZXdr4POkWQoQIoELpP0yfuCt
         VTA7ATIKZ2FUZ2xsPsu4/MNNrCvX1JnpUEOR21x2xd/vz093ubat96QBlN+TSX2AlC7g
         FBOpG294Bi3M5k4pjAexrtU+zQdxs6uVOBMum/As04W+q3X5jWtJjm8RcgusSbFdocxX
         E5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EIQbB2zgXphNhV7qrszr5PCCFMAd5NNV0AVDvZDtQIY=;
        b=lo9jIDdLx1cpBeJ5U4qkzNTKnQmoRYj8GFdU1+XuwUeCbIrbqLiNSfjfV+q06qSLuT
         jpALMfAOBvySbKwRCaaUh1h3+JyUHGQAl1ANwAVBUQUX0cPz3k6QI43t6kf+/Y1jbAC2
         45YAl4rapG3TQ1vTCyO6Nd9UhMZCsx/yTQJ91zC7UUOZwrA44ksaRnEZQQSMBOHa+jTP
         PXYx5mQZo7prvULogX/MNAYzwO36gGQyBrf9ma3QgHOhbo0qOkK/si/VpArK7bvfXizh
         zHCWwyr8MMuulSBt2beFzwj4ztHCKBDbnyOyrqISU6tDAYk8rEmwCNLtUC2Y7bsRklbb
         oU6Q==
X-Gm-Message-State: APjAAAUc9arWYBy6n3nb8bY1blfF7Bu+u/IoPusQ4jVCViuS1sXHp9w7
	SuZbOPWjSBBE4OEE9Dx7voY=
X-Google-Smtp-Source: APXvYqzGTKAm/77GYVRlS+dpkqPeW8l/Pd4ZwGUtpE7m7NKS5bwuzo9CN+a6M86+KtzKEnQ59JgzPA==
X-Received: by 2002:a6b:6b14:: with SMTP id g20mr83413865ioc.28.1564584731100;
        Wed, 31 Jul 2019 07:52:11 -0700 (PDT)
Received: from [192.168.1.57] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id j14sm57989996ioa.78.2019.07.31.07.52.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 07:52:10 -0700 (PDT)
Subject: Re: [PATCH v2] nbd: replace kill_bdev() with __invalidate_device()
 again
To: SunKe <sunke32@huawei.com>, josef@toxicpanda.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org, kamatam@amazon.com, manoj.br@gmail.com,
 stable@vger.kernel.org, dwmw@amazon.com
References: <1564575190-132357-1-git-send-email-sunke32@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <2b77d06d-3610-b2f7-d95f-8925b6bd49bf@kernel.dk>
Date: Wed, 31 Jul 2019 08:52:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564575190-132357-1-git-send-email-sunke32@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <n8lTPDXgANJ.A.whH.U8aQdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/612
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2b77d06d-3610-b2f7-d95f-8925b6bd49bf@kernel.dk
Resent-Date: Wed, 31 Jul 2019 15:09:08 +0000 (UTC)

On 7/31/19 6:13 AM, SunKe wrote:
> From: Munehisa Kamata <kamatam@amazon.com>
> 
> Commit abbbdf12497d ("replace kill_bdev() with __invalidate_device()")
> once did this, but 29eaadc03649 ("nbd: stop using the bdev everywhere")
> resurrected kill_bdev() and it has been there since then. So buffer_head
> mappings still get killed on a server disconnection, and we can still
> hit the BUG_ON on a filesystem on the top of the nbd device.
> 
>    EXT4-fs (nbd0): mounted filesystem with ordered data mode. Opts: (null)
>    block nbd0: Receive control failed (result -32)
>    block nbd0: shutting down sockets
>    print_req_error: I/O error, dev nbd0, sector 66264 flags 3000
>    EXT4-fs warning (device nbd0): htree_dirblock_to_tree:979: inode #2: lblock 0: comm ls: error -5 reading directory block
>    print_req_error: I/O error, dev nbd0, sector 2264 flags 3000
>    EXT4-fs error (device nbd0): __ext4_get_inode_loc:4690: inode #2: block 283: comm ls: unable to read itable block
>    EXT4-fs error (device nbd0) in ext4_reserve_inode_write:5894: IO failure
>    ------------[ cut here ]------------
>    kernel BUG at fs/buffer.c:3057!
>    invalid opcode: 0000 [#1] SMP PTI
>    CPU: 7 PID: 40045 Comm: jbd2/nbd0-8 Not tainted 5.1.0-rc3+ #4
>    Hardware name: Amazon EC2 m5.12xlarge/, BIOS 1.0 10/16/2017
>    RIP: 0010:submit_bh_wbc+0x18b/0x190
>    ...
>    Call Trace:
>     jbd2_write_superblock+0xf1/0x230 [jbd2]
>     ? account_entity_enqueue+0xc5/0xf0
>     jbd2_journal_update_sb_log_tail+0x94/0xe0 [jbd2]
>     jbd2_journal_commit_transaction+0x12f/0x1d20 [jbd2]
>     ? __switch_to_asm+0x40/0x70
>     ...
>     ? lock_timer_base+0x67/0x80
>     kjournald2+0x121/0x360 [jbd2]
>     ? remove_wait_queue+0x60/0x60
>     kthread+0xf8/0x130
>     ? commit_timeout+0x10/0x10 [jbd2]
>     ? kthread_bind+0x10/0x10
>     ret_from_fork+0x35/0x40
> 
> With __invalidate_device(), I no longer hit the BUG_ON with sync or
> unmount on the disconnected device.

Applied, thanks.

-- 
Jens Axboe

