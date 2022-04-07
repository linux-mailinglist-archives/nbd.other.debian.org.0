Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C404F898D
	for <lists+nbd@lfdr.de>; Fri,  8 Apr 2022 00:14:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C0C4620612; Thu,  7 Apr 2022 22:14:51 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr  7 22:14:51 2022
Old-Return-Path: <v.sementsov-og@mail.ru>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,SARE_FREE_WEBM_RuMail,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 30BB82060F
	for <lists-other-nbd@bendel.debian.org>; Thu,  7 Apr 2022 22:14:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.419 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
	SARE_FREE_WEBM_RuMail=0.671, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id sa1Xrj6LL4n5 for <lists-other-nbd@bendel.debian.org>;
	Thu,  7 Apr 2022 22:14:37 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from fallback14.mail.ru (fallback14.mail.ru [94.100.179.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 70C9D20608
	for <nbd@other.debian.org>; Thu,  7 Apr 2022 22:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail3;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=2dcAPMVR3oxVk+zu/fc4HrWSkuz6m6bMSQ7w3v/eeYE=;
	t=1649369677;x=1649975077; 
	b=jYAaOP8+53sTcMQGbJA7SuxRCJKvYV9TAuXSU0TiwCf54jt+i6nf961zVaunWHZASMZgi/ZxAiVp5KDOl5Par5twajA4LWqPJDNrOiRJn5dhpW84vok0lYMzigVThL+7L2aR9LIpF+EK2YSEXo/SGU0okR5ZLQyVpA6YZ68wF64=;
Received: from [10.161.25.36] (port=57430 helo=smtp59.i.mail.ru)
	by fallback14.m.smailru.net with esmtp (envelope-from <v.sementsov-og@mail.ru>)
	id 1ncaOf-0003yj-N0; Fri, 08 Apr 2022 01:14:33 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=2dcAPMVR3oxVk+zu/fc4HrWSkuz6m6bMSQ7w3v/eeYE=;
	t=1649369673;x=1649975073; 
	b=CvKTRwm1I4ytTSnc0vexaYkjeOwBfT2f7MX0pvR734IJ6XdT1pr+q0pVxE3fILWXgHpcqvNcPzrFghHQO61TtCbIM79qrJ+z23Qc/01wpV/ZyVxNMiIyRtdWHNBwQrSqxYL15SRYqDsmZAov5odKXcUR+BeXtuIikCRLMn93yPoiWzI6RUS2In9L24Yp4qFDfCKRVopSEBsogOQLDOiKuIx+E9M+Bp3EdqJQfrbt8mYZ0bj+FjS2m7r62o8V3NT/GZFXqvS2yGI93Scmgl8d+hNr8L8YMP0+5a/Sz/XaAe7ON7E/0hJH+EVaDB7UpXStp8gG8BADNlnJ4s69FQyb7g==;
Received: by smtp59.i.mail.ru with esmtpa (envelope-from <v.sementsov-og@mail.ru>)
	id 1ncaOW-00024p-Ev; Fri, 08 Apr 2022 01:14:25 +0300
Message-ID: <0e3cef84-e479-f12d-f25f-f26b9f3a2d1a@mail.ru>
Date: Fri, 8 Apr 2022 01:14:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] spec: Recommend cap on NBD_REPLY_TYPE_BLOCK_STATUS
 length
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, nbd@other.debian.org
Cc: libguestfs@redhat.com, qemu-block@nongnu.org
References: <20220407213720.250252-1-eblake@redhat.com>
 <20220407213720.250252-2-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220407213720.250252-2-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9B63E071AA8307CB82B3AB354827124F49693BE9061140C24182A05F5380850403F5E159A606AB4E771DD781FF3C25B9BA8B10943BC76DC812A3E1120ADA999A3
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76042E2DB3E33BF2BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AAEFEF2B38A4D0058638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89899D44900BF451ABE5D9DFECBC8A0226F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74FABA58A27EC4FF79FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD1828451B159A507268D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BEC1C9C6CFAD2A0F5A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC29CCCB165C7854CD3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F790063733A25861FFD6A8E5EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C393E899A2A207F19735872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5CFDBB2168802A45E240000A655CE2D13530118B4570EA0B9D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75B66DA94168EAEAEF8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D346BEB6F73FB9D1E4A34AC44706C60D58F0AAD276B68A9188428AEE3201DF72406BDBAE71DC876304A1D7E09C32AA3244CE573D181A82A6840CB3171988AF2EB3460759606DA2E136A927AC6DF5659F194
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojzDs61/8Pi1HH6qexmkzb2Q==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C3913AABECE9C7EFB720091D2F92068A7617A307A24EBD9CB6D63E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4D699CF5C96332D13F8B6A21999C6E048F0CD7D16867A59B7049FFFDB7839CE9E78D84D2768DEDFD6DB3C3FE27501C99555C72134CC612573F3E4ECC6C5A02679
X-7FA49CB5: 0D63561A33F958A51A861AAE5DBADB19FCA0745E9A0FF3C05C6B95A6160455DBCACD7DF95DA8FC8BD5E8D9A59859A8B6DA390B21A98FAFA6CC7F00164DA146DAFE8445B8C89999728AA50765F79006375A3B25A3A11CE7E4389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC86633242DC0339950F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C5DA91C8160F4BAA0AD7EC71F1DB884274AD6D5ED66289B52698AB9A7B718F8C442539A7722CA490CD5E8D9A59859A8B6801D281B1DD3941D75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A51A861AAE5DBADB19FCA0745E9A0FF3C0D39069E3A1CDAEA0D59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojzDs61/8Pi1Es4mAWnGKMcA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rp0zgV9DV5M.A.CR.bJ2TiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1924
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/0e3cef84-e479-f12d-f25f-f26b9f3a2d1a@mail.ru
Resent-Date: Thu,  7 Apr 2022 22:14:51 +0000 (UTC)

08.04.2022 00:37, Eric Blake wrote:
> The spec was silent on how many extents a server could reply with.
> However, both qemu and nbdkit (the two server implementations known to
> have implemented the NBD_CMD_BLOCK_STATUS extension) implement a hard
> cap, and will truncate the amount of extents in a reply to avoid
> sending a client a reply larger than the maximum NBD_CMD_READ response
> they are willing to tolerate:
> 
> When qemu first implemented NBD_CMD_BLOCK_STATUS for the
> base:allocation context (qemu commit e7b1948d51, Mar 2018), it behaved
> as if NBD_CMD_FLAG_REQ_ONE were always passed by the client, and never
> responded with more than one extent.  Later, when adding its
> qemu:dirty-bitmap:XXX context extension (qemu commit 3d068aff16, Jun
> 2018), it added a cap to 128k extents (1M+4 bytes), and that cap was
> applied to base:allocation once qemu started sending multiple extents
> for that context as well (qemu commit fb7afc797e, Jul 2018).  Qemu
> extents are never smaller than 512 bytes (other than an exception at
> the end of a file whose size is not aligned to 512), but even so, a
> request for just under 4G of block status could produce 8M extents,
> resulting in a reply of 64M if it were not capped smaller.
> 
> When nbdkit first implemented NBD_CMD_BLOCK_STATUS (nbdkit 4ca66f70a5,
> Mar 2019), it did not impose any restriction on the number of extents
> in the reply chunk.  But because it allows extents as small as one
> byte, it is easy to write a server that can amplify a client's request
> of status over 1M of the image into a reply over 8M in size, and it
> was very easy to demonstrate that a hard cap was needed to avoid
> crashing clients or otherwise killing the connection (a bad server
> impacting the client negatively); unique to nbdkit's situation is the
> fact that because it is designed for plugin server implementations,
> not capping the length of extent also posed a problem to nbdkit as the
> server (a client requesting large block status could cause the server
> to run out of memory depending on the plugin providing the server
> callbacks).  So nbdkit enforced a bound of 1M extents (8M+4 bytes,
> nbdkit commit 6e0dc839ea, Jun 2019).
> 
> Since the limit chosen by these two implementations is different, and
> since nbdkit has versions that were not limited, add this as a SHOULD
> NOT instead of MUST NOT constraint on servers implementing block
> status.  It does not matter that qemu picked a smaller limit that it
> truncates to, since we have already documented that the server may
> truncate for other reasons (such as it being inefficient to collect
> that many extents in the first place).  But documenting the limit now
> becomes even more important in the face of a future addition of 64-bit
> requests, where a client's request is no longer bounded to 4G and
> could thereby produce even more than 8M extents for the corner case
> when every 512 bytes is a new extent, if it were not for this
> recommendation.
> ---
>   doc/proto.md | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index bacccfa..c3c7cd9 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -1815,6 +1815,12 @@ MUST initiate a hard disconnect.
>     the different contexts need not have the same number of extents or
>     cumulative extent length.
> 
> +  Servers SHOULD NOT send more than 2^20 extents in a single reply
> +  chunk; in other words, the maximum size of
> +  `NBD_REPLY_TYPE_BLOCK_STATUS` should not be more than 4 + 8*2^20

"the maximum size .. should not be more" sounds a bit strange. Maybe just "the size .. should not be more" ?

> +  (8,388,612 bytes), even if this requires that the server truncate
> +  the response in relation to the *length* requested by the client.
> +
>     Even if the client did not use the `NBD_CMD_FLAG_REQ_ONE` flag in
>     its request, the server MAY return fewer descriptors in the reply
>     than would be required to fully specify the whole range of requested
> @@ -2181,10 +2187,13 @@ The following request types exist:
>       multiple descriptors, and the final descriptor MAY extend beyond
>       the original requested size if the server can determine a larger
>       length without additional effort.  On the other hand, the server MAY
> -    return less data than requested. However the server MUST return at
> -    least one status descriptor (and since each status descriptor has
> -    a non-zero length, a client can always make progress on a
> -    successful return).  The server SHOULD use different *status*
> +    return less data than requested.  In particular, a server SHOULD NOT
> +    send more than 2^20 status descriptors in a single chunk.
> +
> +    However the server MUST return at least one status descriptor,
> +    and since each status descriptor has a non-zero length, a client
> +    can always make progress on a successful return.  The server SHOULD
> +    use different *status*
>       values between consecutive descriptors where feasible, although
>       the client SHOULD be prepared to handle consecutive descriptors
>       with the same *status* value.  The server SHOULD use descriptor

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>


-- 
Best regards,
Vladimir

