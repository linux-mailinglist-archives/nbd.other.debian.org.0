Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 389D97C453
	for <lists+nbd@lfdr.de>; Wed, 31 Jul 2019 16:06:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 21AAB20210; Wed, 31 Jul 2019 14:06:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul 31 14:06:08 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VERIFIED,FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8DD8F20169
	for <lists-other-nbd@bendel.debian.org>; Wed, 31 Jul 2019 13:50:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 17GEDba-PiL4 for <lists-other-nbd@bendel.debian.org>;
	Wed, 31 Jul 2019 13:50:46 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x843.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 869EC20163
	for <nbd@other.debian.org>; Wed, 31 Jul 2019 13:50:45 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id 44so35555288qtg.11
        for <nbd@other.debian.org>; Wed, 31 Jul 2019 06:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tZpiteHABmHMSPpeLCCgPpkl35yK+eRJrcx7w2v7BEo=;
        b=o6I0yztQ1uBb+6DsjOUES/0UAzIKGGSeIrZ8gkPuLrON4Nso+SDoVEbRa1BLAzuSCf
         ErC6mUpCB+VqiZwhrAmJmBWowLRoMID0tUyqfqpp9q3BWoENvWchtAPBmlWV1s+VbvT8
         uutaOozlWtACYU/FE7BNq1xTUq1gl3/ZyxJP7O7uY1tRfIOxGT5ZUXKtpLolQN2g+QwR
         RDoo3JJSraTJwegn4rrCm/gXXEWJ3yphA0St01h54eeo5YEHXyQf5s98ls3OOqvJPC54
         SN4zPBofrA2xQ8VRskBbr0cx0NkxQyup162ArnuwqH49QCPQvkHcNhPjIJwmapcpQPkX
         VLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tZpiteHABmHMSPpeLCCgPpkl35yK+eRJrcx7w2v7BEo=;
        b=CJsLlLTLIOpOGtnJmoMbSqEoMt1YQtfThA1bOZi56XI8v4Uhm3GTw1Pt6UgJOLK88v
         3RtoXb9FWTr7rgFdhfho3c5atxXVn6XUTjZzUjiHQlypJK9As4qtuzL3aQNffcnDonm6
         m5DB6103sQJcDdR/reReerRZQoOd0/f4h8GI/pACj+hgjAA9/YXOgpB18bZeDwbpZEWj
         zb4WD5ZweVHFzFDim5TnADYGO3vaPSSmFCugw69mxWmW0UpjST+n++8oZFv6B+3kHnoa
         xnHcVDPNbhSS69i9sZJUu6H74Ae59tm71oI9dzaY8mIqoJm7Clh+hcQYZS7iHVmHAjc5
         Rlvw==
X-Gm-Message-State: APjAAAWp8cqdzhiEda7WSl6S/lHZ4UU1UXreqACBJezhSU2zqNKPR7Fs
	lbqyrd5SQ6zKBjKcw+VLyPY=
X-Google-Smtp-Source: APXvYqz/0GnRZMGK0hAP4dkgd4FJ4+Sorx1A7OT3jZAGzwNrYJMYdLwowSdZum6AL+DPDDpZgp9GCg==
X-Received: by 2002:ac8:2c8c:: with SMTP id 12mr86009283qtw.137.1564581042595;
        Wed, 31 Jul 2019 06:50:42 -0700 (PDT)
Received: from localhost ([107.15.81.208])
        by smtp.gmail.com with ESMTPSA id j2sm31211885qtb.89.2019.07.31.06.50.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 06:50:41 -0700 (PDT)
Date: Wed, 31 Jul 2019 09:50:40 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: SunKe <sunke32@huawei.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	kamatam@amazon.com, manoj.br@gmail.com, stable@vger.kernel.org,
	dwmw@amazon.com
Subject: Re: [PATCH v2] nbd: replace kill_bdev() with __invalidate_device()
 again
Message-ID: <20190731135039.uisoh37v626h2aco@MacBook-Pro-91.local>
References: <1564575190-132357-1-git-send-email-sunke32@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564575190-132357-1-git-send-email-sunke32@huawei.com>
User-Agent: NeoMutt/20180716
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7wbHIwrkb0B.A.8iF.QBaQdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/611
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190731135039.uisoh37v626h2aco@MacBook-Pro-91.local
Resent-Date: Wed, 31 Jul 2019 14:06:08 +0000 (UTC)

On Wed, Jul 31, 2019 at 08:13:10PM +0800, SunKe wrote:
> From: Munehisa Kamata <kamatam@amazon.com>
> 
> Commit abbbdf12497d ("replace kill_bdev() with __invalidate_device()")
> once did this, but 29eaadc03649 ("nbd: stop using the bdev everywhere")
> resurrected kill_bdev() and it has been there since then. So buffer_head
> mappings still get killed on a server disconnection, and we can still
> hit the BUG_ON on a filesystem on the top of the nbd device.
> 
>   EXT4-fs (nbd0): mounted filesystem with ordered data mode. Opts: (null)
>   block nbd0: Receive control failed (result -32)
>   block nbd0: shutting down sockets
>   print_req_error: I/O error, dev nbd0, sector 66264 flags 3000
>   EXT4-fs warning (device nbd0): htree_dirblock_to_tree:979: inode #2: lblock 0: comm ls: error -5 reading directory block
>   print_req_error: I/O error, dev nbd0, sector 2264 flags 3000
>   EXT4-fs error (device nbd0): __ext4_get_inode_loc:4690: inode #2: block 283: comm ls: unable to read itable block
>   EXT4-fs error (device nbd0) in ext4_reserve_inode_write:5894: IO failure
>   ------------[ cut here ]------------
>   kernel BUG at fs/buffer.c:3057!
>   invalid opcode: 0000 [#1] SMP PTI
>   CPU: 7 PID: 40045 Comm: jbd2/nbd0-8 Not tainted 5.1.0-rc3+ #4
>   Hardware name: Amazon EC2 m5.12xlarge/, BIOS 1.0 10/16/2017
>   RIP: 0010:submit_bh_wbc+0x18b/0x190
>   ...
>   Call Trace:
>    jbd2_write_superblock+0xf1/0x230 [jbd2]
>    ? account_entity_enqueue+0xc5/0xf0
>    jbd2_journal_update_sb_log_tail+0x94/0xe0 [jbd2]
>    jbd2_journal_commit_transaction+0x12f/0x1d20 [jbd2]
>    ? __switch_to_asm+0x40/0x70
>    ...
>    ? lock_timer_base+0x67/0x80
>    kjournald2+0x121/0x360 [jbd2]
>    ? remove_wait_queue+0x60/0x60
>    kthread+0xf8/0x130
>    ? commit_timeout+0x10/0x10 [jbd2]
>    ? kthread_bind+0x10/0x10
>    ret_from_fork+0x35/0x40
> 
> With __invalidate_device(), I no longer hit the BUG_ON with sync or
> unmount on the disconnected device.
> 

Jeeze I swear I see this same patch go by every 6 months or so, not sure what
happens to it.  Anyway

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

