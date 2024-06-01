Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1188D6E90
	for <lists+nbd@lfdr.de>; Sat,  1 Jun 2024 08:48:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C5DF72058A; Sat,  1 Jun 2024 06:48:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jun  1 06:48:32 2024
Old-Return-Path: <michel@famille-lp.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MD5_SHA1_SUM,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E52D220587
	for <lists-other-nbd@bendel.debian.org>; Sat,  1 Jun 2024 06:32:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, MD5_SHA1_SUM=-1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ERtLtcWMJMJH for <lists-other-nbd@bendel.debian.org>;
	Sat,  1 Jun 2024 06:32:12 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .famille-lp. - helo: .smtp2-g21.free. - helo-domain: .free.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id F0C3F2053C
	for <nbd@other.debian.org>; Sat,  1 Jun 2024 06:32:11 +0000 (UTC)
Received: from mail.famille-lp.fr (unknown [82.64.142.12])
	by smtp2-g21.free.fr (Postfix) with ESMTPS id ED2EA20039E;
	Sat,  1 Jun 2024 08:32:03 +0200 (CEST)
Received: from [192.168.0.7] (unknown [10.0.0.1])
	by mail.famille-lp.fr (Postfix) with ESMTPSA id 8DECFA0B8B;
	Sat,  1 Jun 2024 06:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=famille-lp.fr;
	s=local; t=1717223523;
	bh=sPpUWYqfJp5cwAeUS4VoZjs3sQm3X8bcKnRiemeWoQU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GWCSfDk6d+dxbFfi+RGWTxvUg8Xej3QIapl5PxBvDyYX+anLPYL85zA2IvDBRHs8L
	 /KPMAbetG/7WGqTVaWb23FSys58wEJRel01xQjPBKhIZSiCroSLY1Q+yq9JoLTP5+R
	 YKdmHwAHpxl40vmEq59JXoG1pt9cK1r65zE5qprs=
Message-ID: <ab3da084-e119-4370-b935-b9c183ab5810@famille-lp.fr>
Date: Sat, 1 Jun 2024 08:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG REPORT][BLOCK/NBD] Error when accessing qcow2 image through
 NBD
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 nbd@other.debian.org, linux-kernel@vger.kernel.org
References: <6d33a50a-eea5-4a40-8976-fd6beff191ad@gmail.com>
 <5d188452-fe93-48b3-9eb7-e0fbcb5e3648@famille-lp.fr>
 <CAEzrpqfg6V5Pc-CcMqgceRapUWfb-HjAkFU9TUSEAoBNXbToFA@mail.gmail.com>
Content-Language: fr
From: Michel LAFON-PUYO <michel@famille-lp.fr>
In-Reply-To: <CAEzrpqfg6V5Pc-CcMqgceRapUWfb-HjAkFU9TUSEAoBNXbToFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VbnK_opWGYF.A.JaiJ.ARsWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2889
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ab3da084-e119-4370-b935-b9c183ab5810@famille-lp.fr
Resent-Date: Sat,  1 Jun 2024 06:48:32 +0000 (UTC)

Le 31/05/2024 à 17:17, Josef Bacik a écrit :
> On Fri, May 31, 2024 at 1:48 AM Michel LAFON-PUYO <michel@famille-lp.fr> wrote:
>> Hi!
>>
>>
>> When switching from version 6.8.x to version 6.9.x, I've noticed errors when mounting NBD device:
>>
>> mount: /tmp/test: can't read superblock on /dev/nbd0.
>>          dmesg(1) may have more information after failed mount system call.
>>
>> dmesg shows this kind of messages:
>>
>> [    5.138056] mount: attempt to access beyond end of device
>>                  nbd0: rw=4096, sector=2, nr_sectors = 2 limit=0
>> [    5.138062] EXT4-fs (nbd0): unable to read superblock
>> [    5.140097] nbd0: detected capacity change from 0 to 1024000
>>
>> or
>>
>> [  144.431247] blk_print_req_error: 61 callbacks suppressed
>> [  144.431250] I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 4 prio class 0
>> [  144.431254] buffer_io_error: 66 callbacks suppressed
>> [  144.431255] Buffer I/O error on dev nbd0, logical block 0, async page read
>> [  144.431258] Buffer I/O error on dev nbd0, logical block 1, async page read
>> [  144.431259] Buffer I/O error on dev nbd0, logical block 2, async page read
>> [  144.431260] Buffer I/O error on dev nbd0, logical block 3, async page read
>> [  144.431273] I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>> [  144.431275] Buffer I/O error on dev nbd0, logical block 0, async page read
>> [  144.431278] I/O error, dev nbd0, sector 2 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>> [  144.431279] Buffer I/O error on dev nbd0, logical block 1, async page read
>> [  144.431282] I/O error, dev nbd0, sector 4 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>> [  144.431283] Buffer I/O error on dev nbd0, logical block 2, async page read
>> [  144.431286] I/O error, dev nbd0, sector 6 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>> [  144.431287] Buffer I/O error on dev nbd0, logical block 3, async page read
>> [  144.431289]  nbd0: unable to read partition table
>> [  144.435144] I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>> [  144.435154] Buffer I/O error on dev nbd0, logical block 0, async page read
>> [  144.435161] I/O error, dev nbd0, sector 2 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>> [  144.435166] Buffer I/O error on dev nbd0, logical block 1, async page read
>> [  144.435170] I/O error, dev nbd0, sector 4 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>> [  144.436007] I/O error, dev nbd0, sector 6 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>> [  144.436023] I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
>> [  144.436034]  nbd0: unable to read partition table
>> [  144.437036]  nbd0: unable to read partition table
>> [  144.438712]  nbd0: unable to read partition table
>>
>> It can be reproduced on v6.10-rc1.
>>
>> I've bisected the commits between v6.8 tag and v6.9 tag on vanilla master branch and found out that commit 242a49e5c8784e93a99e4dc4277b28a8ba85eac5 seems to introduce this regression. When reverting this commit, everything seems fine.
>>
>> There is only one change in this commit in drivers/block/nbd.c.
>>
>> -static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
>> +static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
>>
>> +static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
>> +               loff_t blksize)
>> +{
>> +       int error;
>> +
>> +       blk_mq_freeze_queue(nbd->disk->queue);
>> +       error = __nbd_set_size(nbd, bytesize, blksize);
>> +       blk_mq_unfreeze_queue(nbd->disk->queue);
>> +
>> +       return error;
>> +}
>> +
>>
>> To reproduce the issue, you need qemu-img and qemu-nbd. Executing the following script (as root) triggers the issue. This is not systematic but running the script once or twice is generally sufficient to get an error.
>>
>> qemu-img create -f qcow2 test.img 500M
>> qemu-nbd -c /dev/nbd0 test.img
>> mkfs.ext4 /dev/nbd0
>> qemu-nbd -d /dev/nbd0
>> mkdir /tmp/test
>>
>> for i in {1..20} ; do
>>       qemu-nbd -c /dev/nbd0 test.img
>>       mount /dev/nbd0 /tmp/test
>>       umount /dev/nbd0
>>       qemu-nbd -d /dev/nbd0
>>       sleep 0.5
>> done
>>
>> Output of the script is similar to:
>>
>> /dev/nbd0 disconnected
>> /dev/nbd0 disconnected
>> /dev/nbd0 disconnected
>> /dev/nbd0 disconnected
>> /dev/nbd0 disconnected
>> /dev/nbd0 disconnected
>> /dev/nbd0 disconnected
>> mount: /tmp/test: can't read superblock on /dev/nbd0.
>>          dmesg(1) may have more information after failed mount system call.
>>
>> Can you please have a look at this issue?
>> I can help at testing patches.
>>
> This is just you racing with the connection being ready and the device
> being ready and you trying to mount it.  The timing has changed, if
> you look at this patch that I added for blk-tests you'll see the sort
> of thing that needs to be done
>
> https://github.com/osandov/blktests/commit/698f1a024cb4d69b4b6cd5500b72efa758340d05
>
> A better option for you is to load the module with devices=0, and use
> the netlink thing so that the device doesn't show up until it's
> actually connected.  This problem exists because historically we used
> the device itself to get configured, instead of a control device that
> would then add the device once it is ready.  We can't change the old
> way, but going forward to avoid this style of problem you'll want to
> use nbds_max=0 and then use the netlink interface for configuration,
> that'll give you a much more "normal" experience.  Thanks,
>
> Josef

Hi Josef,

I worked around the issue as you did in blk-tests. Thanks a lot for your support.

Michel

