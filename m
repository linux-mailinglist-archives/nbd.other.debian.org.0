Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CCF632F72
	for <lists+nbd@lfdr.de>; Mon, 21 Nov 2022 23:00:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A2947205DF; Mon, 21 Nov 2022 22:00:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 21 22:00:11 2022
Old-Return-Path: <skhan@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2A24220534
	for <lists-other-nbd@bendel.debian.org>; Mon, 21 Nov 2022 21:43:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.304 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id sJY51ApL4FD6 for <lists-other-nbd@bendel.debian.org>;
	Mon, 21 Nov 2022 21:43:35 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linuxfoundation. - helo: .mail-io1-xd2b.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B6E8120532
	for <nbd@other.debian.org>; Mon, 21 Nov 2022 21:43:35 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id s10so9635276ioa.5
        for <nbd@other.debian.org>; Mon, 21 Nov 2022 13:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ImVe+g+b+10JJjRyFbVg3VQDLgN59Ue/Abv7vaFmseQ=;
        b=OHO4FjaPJmimqdrzS/OkstIvhocxCz1emkoHfOdBnFW624ABdZXIGpUr2qg1Kuoid7
         jQ3zRS/xznKzGtwvpkBw8YcBHanbAjUGKtSMJ92a5WUJdkI77H4tBot4cVhu32vyccdd
         iMTMhCXmKhazzg9UmrMMNr5aOJxLl31QLMnEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ImVe+g+b+10JJjRyFbVg3VQDLgN59Ue/Abv7vaFmseQ=;
        b=kfcQSHr2kULvVIGTHn8ag/9e3EwL9VtetLb7aFUQ/spN03RMzAz1Us1rZGey5Su49n
         skSYSrUW/gwRyHR9PDAlHOAsqQem1mtHJsc/w14ULO8ARZ/MoLUWs2TOL78e1H47mRjE
         uBdm8T8mSRaOMqS+bbGYUaWvbNQHwA9V3aoyNVw45Iijb80aFFSg4X125w/TCnlQCTvG
         XuKWOqizyNNCbcBWIRzOumAkZUYXxMcD0H/iUojBy6MVvbSTUgaJQDHA+JnTz0yUw7UC
         dvhpoWDPfovncxM2Tlv/sfDwhRVl0GADyOOUuSkxXXQTQ16XBIFNtbD29+VoZiOqNOmO
         sSTQ==
X-Gm-Message-State: ANoB5pnEnDZe1auYYxQnobpj9S3GhRneYXoTbEZdpCez9KCVJvBiQvc+
	Ta/JxMqkTPKUmnWDFEUJBEh90w==
X-Google-Smtp-Source: AA0mqf7f7poc1w7ewSMxS1++ciq574fA83Q7zTNUSYFoHm3cWPyzQwbrRSPhTjg/tqVe+6wU++ijsA==
X-Received: by 2002:a5d:9c0d:0:b0:6de:e346:27d4 with SMTP id 13-20020a5d9c0d000000b006dee34627d4mr639526ioe.138.1669067012402;
        Mon, 21 Nov 2022 13:43:32 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id p5-20020a92c105000000b00302a7165d9bsm3672008ile.53.2022.11.21.13.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 13:43:31 -0800 (PST)
Message-ID: <26d98c8f-372b-b9c8-c29f-096cddaff149@linuxfoundation.org>
Date: Mon, 21 Nov 2022 14:43:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 2/3] Treewide: Stop corrupting socket's task_frag
Content-Language: en-US
To: Benjamin Coddington <bcodding@redhat.com>,
 David Howells <dhowells@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Lee Duncan <lduncan@suse.com>,
 Chris Leech <cleech@redhat.com>, Mike Christie
 <michael.christie@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marc Dionne <marc.dionne@auristor.com>, Steve French <sfrench@samba.org>,
 Christine Caulfield <ccaulfie@redhat.com>,
 David Teigland <teigland@redhat.com>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, drbd-dev@lists.linbit.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-nvme@lists.infradead.org, open-iscsi@googlegroups.com,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, cluster-devel@redhat.com,
 ocfs2-devel@oss.oracle.com, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <c2ec184226acd21a191ccc1aa46a1d7e43ca7104.1669036433.git.bcodding@redhat.com>
 <cover.1669036433.git.bcodding@redhat.com>
 <382872.1669039019@warthog.procyon.org.uk>
 <51B5418D-34FB-4E87-B87A-6C3FCDF8B21C@redhat.com>
 <4585e331-03ad-959f-e715-29af15f63712@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <4585e331-03ad-959f-e715-29af15f63712@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jsflfYqWv4B.A.yLD.rT_ejB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2298
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/26d98c8f-372b-b9c8-c29f-096cddaff149@linuxfoundation.org
Resent-Date: Mon, 21 Nov 2022 22:00:11 +0000 (UTC)

On 11/21/22 14:40, Shuah Khan wrote:
> On 11/21/22 07:34, Benjamin Coddington wrote:
>> On 21 Nov 2022, at 8:56, David Howells wrote:
>>
>>> Benjamin Coddington <bcodding@redhat.com> wrote:
>>>
>>>> Since moving to memalloc_nofs_save/restore, SUNRPC has stopped setting the
>>>> GFP_NOIO flag on sk_allocation which the networking system uses to decide
>>>> when it is safe to use current->task_frag.
>>>
>>> Um, what's task_frag?
>>
>> Its a per-task page_frag used to coalesce small writes for networking -- see:
>>
>> 5640f7685831 net: use a per task frag allocator
>>
>> Ben
>>
>>
> 
> I am not seeing this in the mainline. Where can find this commit?
> 

Okay. I see this commit in the mainline. However, I don't see the
sk_use_task_frag in mainline.

thanks,
-- Shuah

