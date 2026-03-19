Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM2qJhf7u2nxqwIAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Thu, 19 Mar 2026 14:33:11 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F8F2CC0C3
	for <lists+nbd@lfdr.de>; Thu, 19 Mar 2026 14:33:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1C5E8204B1; Thu, 19 Mar 2026 13:33:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 19 13:33:11 2026
Old-Return-Path: <pabeni@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5D0082043E
	for <lists-other-nbd@bendel.debian.org>; Thu, 19 Mar 2026 13:15:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.377 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1sXrhd7gCh5n for <lists-other-nbd@bendel.debian.org>;
	Thu, 19 Mar 2026 13:15:24 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id E81C4204D1
	for <nbd@other.debian.org>; Thu, 19 Mar 2026 13:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773926118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nY70eJF99QytEX7DipnKVmL+suwwJ5IWXmC9xLflxuQ=;
	b=b+HvSCNqADMbeYweShmjDYfPhDE8KwQ/mmFzac448RaUUEXaiZ9odNSybZQ5ed4ktPUMHT
	SaiR0i3bbLYk7kHkMNXQRVs9ywMVT/UWbkELANIR9bhUZISDbYRALMak1aSV9YYiGXa79n
	yzX6R7GdzKC/TIXuWTOlwBITJE0cxEo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-kkYAk9ZRN72qubj8EQvqRw-1; Thu, 19 Mar 2026 08:44:04 -0400
X-MC-Unique: kkYAk9ZRN72qubj8EQvqRw-1
X-Mimecast-MFC-AGG-ID: kkYAk9ZRN72qubj8EQvqRw_1773924243
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48532df52c5so9204645e9.1
        for <nbd@other.debian.org>; Thu, 19 Mar 2026 05:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924243; x=1774529043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nY70eJF99QytEX7DipnKVmL+suwwJ5IWXmC9xLflxuQ=;
        b=bjpHTpzsPrwMYxECn9dgQwRZ4JJqa+LC34cspnWQvR4nZ4rZluC20mjrHWHrMbXsMX
         bKfFTTfIyeK9OfX6lFkDSQoHrU/HgEMKeD7/H9s6+QTixVFu77Ag2clUFbTf9Bqu0N89
         ijn0WQgd9iIW0bERdgvnZIGHEi9yocNOZryShZ/n6MP3B9Lz2I09OPa1LSAzgJ2HB+jM
         lghJ/TFq4M2LVLyFnspLrHDzGkgtkyOsinEE9zHGZY8iCeCg9vTXTC4hDBg1guC6dRvh
         XhOCXuBykUodBL1kW9bCtgyUKZKDx2GUTNkruJpsEWbvphf6rp1j5UZIXOSbw+UXC1kM
         +hJA==
X-Forwarded-Encrypted: i=1; AJvYcCUuZL/qXUWr7iSheGfXA672mOYsW9Aorc6YbwW/d+TDgL2XRy/g3ZyB2TnZoUOjc7x5nBc=@other.debian.org
X-Gm-Message-State: AOJu0Yz3FYkqF3NyQHKJAMC8KuzpQP+1pzjyQ5NmcLIOXK7RvEYPFSQf
	DlRdCZWkyU/+ezTduj4+O/Ro+QXDGLTlHgoeJsTygr2BVXESie8GNOKoinUQj5bPdOCgk4GNJmD
	6gHrNifbxSSvH48BjlJK3xUIbcW8aPU8BfO1dCZ3k7i/GXYD83kAgVy4=
X-Gm-Gg: ATEYQzz1nvXdQn1peXZMw1uhwHK1/uCCUWipXrCZWG0rpoOujqZzYYVAHdJLkTF2hXV
	SLN/FmEl/fk4AhZHi7eXvFeZRv4d8RNuzfZ7A9vyVeFX+ArItUvQpMqgxMlCg2SpIynM5xUR+4s
	yE2xtlZgw6kHt0lCznX/xvpIIzqSVmXUtBncHUM0bWXQHMfEHDpNdjRFwFX/6UdlNqeDlTSRMJz
	SOeaXmN7bT637epqor5Be+bVu+YJEm9WdMN3sWm6NrX4Kf8nOV7fcvzPSRpLR4gMsirgjx/UsSz
	OXX2cn++DD4OqpTUkpNNdBlvrcPsju6A0mflHWoikUsjCMgoYun4fX7weQZN8/WpS4UA55Zzjyk
	NP9bJIdqbo0z2bp8exu9wb0Cfp1UdsAkFyyToaYrOFD5IhVC5cak+xcGl
X-Received: by 2002:a05:600c:1e8c:b0:485:3d43:7c9a with SMTP id 5b1f17b1804b1-486f456fe06mr122764045e9.25.1773924243035;
        Thu, 19 Mar 2026 05:44:03 -0700 (PDT)
X-Received: by 2002:a05:600c:1e8c:b0:485:3d43:7c9a with SMTP id 5b1f17b1804b1-486f456fe06mr122763715e9.25.1773924242570;
        Thu, 19 Mar 2026 05:44:02 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518495aasm15971859f8f.3.2026.03.19.05.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:44:01 -0700 (PDT)
Message-ID: <258f99ac-bd34-4d14-8271-1266b9aba6f8@redhat.com>
Date: Thu, 19 Mar 2026 13:44:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1] net/ipv6: mcast: fix circular locking dependency
 in __ipv6_dev_mc_inc()
To: Jakub Kicinski <kuba@kernel.org>, Jiayuan Chen <jiayuan.chen@linux.dev>,
 Josef Bacik <josef@toxicpanda.com>
Cc: netdev@vger.kernel.org, Jiayuan Chen <jiayuan.chen@shopee.com>,
 syzbot+afbcf622635e98bf40d2@syzkaller.appspotmail.com,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Taehee Yoo <ap420073@gmail.com>, linux-kernel@vger.kernel.org,
 nbd@other.debian.org
References: <20260317111208.62667-1-jiayuan.chen@linux.dev>
 <20260318181536.47ed9fd1@kernel.org>
 <f877e139-2da9-49d9-93bf-9b4155d687a7@linux.dev>
 <20260318202649.004d33fd@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260318202649.004d33fd@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yPYw-FdvKmRv95Se3ye8n03etdxaGC0gMCx75NLMB7A_1773924243
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <FiN9ltCevx.A.pbBM.Xs_upB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3519
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/258f99ac-bd34-4d14-8271-1266b9aba6f8@redhat.com
Resent-Date: Thu, 19 Mar 2026 13:33:11 +0000 (UTC)
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:jiayuan.chen@linux.dev,m:josef@toxicpanda.com,m:netdev@vger.kernel.org,m:jiayuan.chen@shopee.com,m:syzbot+afbcf622635e98bf40d2@syzkaller.appspotmail.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:edumazet@google.com,m:horms@kernel.org,m:ap420073@gmail.com,m:linux-kernel@vger.kernel.org,m:nbd@other.debian.org,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[pabeni@redhat.com,bounce-nbd=lists@other.debian.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,shopee.com,syzkaller.appspotmail.com,davemloft.net,kernel.org,google.com,gmail.com,other.debian.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:helo,bendel.debian.org:rdns];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,bounce-nbd=lists@other.debian.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[nbd,afbcf622635e98bf40d2];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 42F8F2CC0C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adding Josef.

On 3/19/26 4:26 AM, Jakub Kicinski wrote:
> On Thu, 19 Mar 2026 11:04:24 +0800 Jiayuan Chen wrote:
>>>> Split mca_alloc() into mca_alloc() + mca_init(): mca_alloc() does the
>>>> GFP_KERNEL allocation before mc_lock, mca_init() initializes under
>>>> mc_lock. If the address already exists, the pre-allocated memory is
>>>> simply freed. Also move inet6_ifmcaddr_notify() outside mc_lock since
>>>> it also does GFP_KERNEL allocation.  
>>> Moving the allocation seems fine, but also having to move the
>>> notification, potentially letting the notification go out of order
>>> makes me wonder if we aren't better off adding helpers for taking this
>>> lock which also call memalloc_noio_{save,restore} ?  
>> Yeah, using memalloc_noio helpers is simpler. I checked and there
>> are about 18 places taking mc_lock, so having a common mc_lock()/mc_unlock()
>> wrapper that does the noio save/restore covers them all (if necessary).
>>
>> The only thing that feels a bit odd is using memalloc_noio in the networking
>> subsystem. It makes sense in block/fs to protect itself from recursion.
> 
> Totally agree that it feels a bit odd that we have to worry about IO,
> but unless we can figure out a way to prevent nbd sockets from getting
> here all our solutions are dealing with noio in networking code :(
> IMHO it's better to acknowledge this with the explicit memalloc_noio 
> so future developers don't break things again with a mis-placed
> allocation.

I think a problem here is that the nbd socket is still exposed to
user-space, while in use by the block device. I fear that the more
syzkaller will learn new tricks, the more we will have to had strange
noio all around the networking code.

I *think* we could prevent this kind of races with something alike the
following:
- nbd sets a DOIO sk flag on the sockets it uses.
- the socket layer prevents socketopts()/ioctl() entirely on DOIO sk

I'm not sure if that could break nbd users, but allowing the user-space
to mess with the socket used for backing a block device looks very
dangerous.

/P

